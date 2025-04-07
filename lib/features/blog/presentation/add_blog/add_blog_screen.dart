import 'dart:io';

import 'package:blogapp/core/res/space.dart';
import 'package:blogapp/core/utils/pick_image.dart';
import 'package:blogapp/features/blog/presentation/add_blog/widget/blog_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  File? imagePicked;

  void selectedImage() async {
    final pickedImage = await pickImageFile();
    if (pickedImage != null) {
      setState(() {
        imagePicked = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.check_mark)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  selectedImage();
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Center(
                      child:
                          imagePicked == null
                              ? Text('Add picture')
                              : Image.file(imagePicked!, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SpaceH20(),
              BlogTextfield(hintText: 'Blog Title', maxLines: 1),
              SpaceH20(),
              BlogTextfield(hintText: 'Blog Description'),
              SpaceH20(),
            ],
          ),
        ),
      ),
    );
  }
}
