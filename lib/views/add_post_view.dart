import 'dart:io';

import 'package:instagram/models/post.dart';
import 'package:instagram/services/auth.dart';
import 'package:instagram/services/firebase_storage_services.dart';
import 'package:instagram/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key key}) : super(key: key);

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  File image;
  String comment;

  @override
  void initState() {
    pickImage();
    super.initState();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    image = File(pickedImage.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('Add new Post'),
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: image != null
          ? SafeArea(
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 5, spreadRadius: 5),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) => comment = value,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Write your Comment',
                          fillColor: Colors.transparent,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Post post = Post(userId: Auth.getUser().uid, comment: comment, id: Uuid().v1());
                        post.imageUrl = await FirebaseStorageServices.uploadPost(image, post.id);
                        await FirestoreServices.addPost(post);
                        print("Done!!!");
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text('Upload', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
