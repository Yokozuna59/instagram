import 'dart:io';

import 'package:instagram/services/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  static Future<String> uploadPost(File image, String id) async {
    try {
      String imageUrl =
          await (await FirebaseStorage.instance.ref('uploads/${Auth.getUser().uid}/posts/$id').putFile(image))
              .ref
              .getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
