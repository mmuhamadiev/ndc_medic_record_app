import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class Storage {

  late String urlLink;

  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath,String fileName) async{
    File file = File(filePath);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy–kk:mm').format(now);
    try{
      await storage.ref('uploads/$formattedDate$fileName').putFile(file);
      final url = await storage.ref('uploads/$formattedDate$fileName').getDownloadURL();
      urlLink = url;
    } on firebase_core.FirebaseException catch(e) {
      print(e);
    }

}
}