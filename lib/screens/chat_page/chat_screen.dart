import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndc_medic_record_app/utils/auth_helper.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:ndc_medic_record_app/utils/storage_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  String receiver;
  bool leading;
  ChatScreen({required this.receiver, required this.leading});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        title: Text(widget.receiver, style: TextStyle(fontSize: 20, fontFamily: 'Grotesque'),),
        backgroundColor: kStaticMainColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where('email', isEqualTo: widget.receiver)
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Text('', style: TextStyle(fontSize: 0),);
            }
            final users = snapshot.data?.docs;
            for (var i in users) {
              final u = i.data()['inChat'];
              map = {1: u.toString()};
            }
            //list.add(user);
            return Text('', style: TextStyle(fontSize: 0),);
          }),
            MessagesStream(
              receiver: widget.receiver,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        showFilePicker(FileType.image);
                      },
                      splashRadius: 20.0,
                      icon: Icon(
                        Icons.attach_file,
                        color: kOrange,
                      )),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: kBlack,fontFamily: 'Grotesque', fontSize: 17),
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration.copyWith(
                          hintText: 'Type message here...',
                          hintStyle: TextStyle(color: Colors.black54, fontFamily: 'Grotesque', fontSize: 17)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Implement send functionality.
                      if(messageText.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Type something to send')));
                      }
                      else {
                        if (map[1] == 'true') {
                          messageTextController.clear();
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'sender': loggedInUser?.email,
                            'receiver': widget.receiver,
                            'timestamp': FieldValue.serverTimestamp(),
                            'url': '',
                            'type': 'text',
                            'unread': 'read',
                          });
                          messageText = '';
                        } else {
                          messageTextController.clear();
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'sender': loggedInUser?.email,
                            'receiver': widget.receiver,
                            'timestamp': FieldValue.serverTimestamp(),
                            'url': '',
                            'type': 'text',
                            'unread': 'unread',
                          });
                          messageText = '';
                        }
                      }

                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAttachmentBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.image, color: kOrange,),
                    title: Text('Image'),
                    onTap: () => showFilePicker(FileType.image)),
              ],
            ),
          );
        });
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
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sending the file')));
      });
      print(fileType.toString());
      print(storage.urlLink);

      if (map[1] == 'true') {
        _firestore.collection('messages').add({
          'text': fileName,
          'sender': loggedInUser?.email,
          'receiver': widget.receiver,
          'timestamp': FieldValue.serverTimestamp(),
          'url': storage.urlLink,
          'type': 'image',
          'unread': 'read',
        });
      }  else if (map[1] == 'false') {
        _firestore.collection('messages').add({
          'text': fileName,
          'sender': loggedInUser?.email,
          'receiver': widget.receiver,
          'timestamp': FieldValue.serverTimestamp(),
          'url': storage.urlLink,
          'type': 'image',
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
              backgroundColor: kStaticMainColor,
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
  MessageBubble({required this.text,
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
    if (type == 'text') {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(color: Colors.black38, fontSize: 15, fontFamily: 'Grotesque'),
            ),
            Material(
              borderRadius: isMe
                  ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))
                  : BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              elevation: 5,
              color: isMe ? kStaticMainColor : kDarkBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Grotesque',
                      fontSize: 20.0,
                      color: isMe ? Colors.white : Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (type == 'image') {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(color: Colors.black38, fontSize: 15, fontFamily: 'Grotesque'),
            ),
            Material(
              borderRadius: isMe
                  ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))
                  : BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              elevation: 5,
              color: isMe ? kStaticMainColor : kDarkBlue,
              child: FullScreenWidget(
                child: ClipRRect(
                  borderRadius: isMe
                      ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                      : BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.all(0.0),);
    }
  }
}
