import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndc_medic_record_app/utils/auth_helper.dart';
import 'package:ndc_medic_record_app/utils/storage_service.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class RecordScreen extends StatefulWidget {
  static const routeName = '/record';

  String receiver;
  bool leading;
  RecordScreen({required this.receiver, required this.leading});

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;
  Map<int, String> map = {};

  @override
  void initState() {
    super.initState();
    getCurrentVoid();
  }

  void getCurrentVoid() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.receiver == 'mmuhamadiev@mail.ru'? null: AppBar(
        leading: widget.leading
            ? IconButton(
                onPressed: () {
                  final userData = FirebaseAuth.instance.currentUser;
                  UserHelper.updateUser(userData, 'false');
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios))
            : null,
        title: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where('email', isEqualTo: widget.receiver)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final users = snapshot.data?.docs;
              List<String> t = [];
              for (var i in users) {
                final u = i.data()['inChat'];
                map = {1: u.toString()};
              }
              //list.add(user);
              return Text('${widget.receiver}');
            }),
        //Text('${widget.receiver}'),
        backgroundColor: kStaticMainColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(
              receiver: widget.receiver,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrange,
        child: Icon(Icons.attach_file),
        onPressed: () {
          showFilePicker(FileType.any);
        },
      )
    );
  }

  final Storage storage = Storage();
  showFilePicker(FileType fileType) async {
    FilePickerResult? file = await FilePicker.platform
        .pickFiles(type: fileType, allowMultiple: false);
    if (file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No file selected')));
    } else if (file != null) {
      final path = file.files.single.path;
      String fileName = file.files.single.name;

      // Upload file
      final uploadTask =
          await storage.uploadFile(path!, fileName).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sending the file')));
      });
      print(fileType.toString());
      print(storage.urlLink);
      if (map[1] == 'true' && fileType.toString() == 'FileType.any') {
        _firestore.collection('messages').add({
          'text': fileName,
          'sender': loggedInUser?.email,
          'receiver': widget.receiver,
          'timestamp': FieldValue.serverTimestamp(),
          'url': storage.urlLink,
          'type': 'file',
          'unread': 'read',
        });
      } else if (map[1] == 'false' && fileType.toString() == 'FileType.any') {
        _firestore.collection('messages').add({
          'text': fileName,
          'sender': loggedInUser?.email,
          'receiver': widget.receiver,
          'timestamp': FieldValue.serverTimestamp(),
          'url': storage.urlLink,
          'type': 'file',
          'unread': 'read',
        });
      }
    }
  }
}

class MessagesStream extends StatelessWidget {
  String receiver;
  MessagesStream({required this.receiver});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];

        for (var message in messages) {
          final messageText = message.data()['text'];
          final messageSender = message.data()['sender'];
          final messageReceiver = message.data()['receiver'];
          final messageUrl = message.data()['url'];
          final messageType = message.data()['type'];

          final currentUser = loggedInUser?.email;
          if (messageReceiver == loggedInUser?.email &&
                  messageSender == receiver ||
              messageReceiver == receiver &&
                  messageSender == loggedInUser?.email) {

            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              //time: messageTime.toString(),
              isMe: currentUser == messageSender,
              type: messageType,
              url: messageUrl,
            );
            messageBubbles.add(messageBubble);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.text,
      required this.sender,
      required this.isMe,
      required this.type,
      required this.url});

  String sender;
  String text;
  bool isMe;
  String type;
  String url;

  @override
  Widget build(BuildContext context) {
    return messages(type, context);
  }

  Padding messages(String type, BuildContext context) {
    if (type == 'file') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(color: Colors.black54, fontSize: 15, fontFamily: 'Grotesque'),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: isMe? MaterialStateProperty.all(kStaticMainColor): MaterialStateProperty.all(kDarkBlue),
                shape: isMe
                    ? MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                ),
              ):
                MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                )
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFViewerFromUrl(
                        url: url,
                        text: text,
                      ),
                    ));
              },
              child: Text(text, style: TextStyle(fontSize: 20, fontFamily: 'Grotesque', color: kWhite),),
            ),
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(0.0),
      );
    }
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url, required this.text})
      : super(key: key);

  final String url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(
            child: Text(
          '$progress %',
          style: TextStyle(fontSize: 30, color: Colors.black),
        )),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}