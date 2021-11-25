import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post.dart';

class FirestoreServices {
  static CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  static Future<void> addPost(Post post) {
    // Call the user's CollectionReference to add a new user

    return posts
        .doc(post.id)
        .set(post.toMap())
        .then((value) => print("Post Added")) // Check if uploading done successfully
        .catchError((error) => print("Failed to add post: $error")); // Check if any error occur during the process
  }
}