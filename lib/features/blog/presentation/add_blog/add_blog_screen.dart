import 'dart:developer';
import 'dart:io';

import 'package:blogapp/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:blogapp/core/common/widgets/loader.dart';
import 'package:blogapp/core/res/space.dart';
import 'package:blogapp/core/utils/pick_image.dart';
import 'package:blogapp/core/utils/utils.dart';
import 'package:blogapp/features/blog/presentation/add_blog/widget/blog_textfield.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';
import 'package:blogapp/features/blog/presentation/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  File? imagePicked;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  void selectedImage() async {
    final pickedImage = await pickImageFile();
    if (pickedImage != null) {
      setState(() {
        imagePicked = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final posterId =
                  (context.read<AppUserCubit>().state as AppUserLoggedIn)
                      .user
                      .id;
              if (imagePicked != null) {
                context.read<BlogBlocBloc>().add(
                  BlogUpload(
                    content: contentController.text.trim(),
                    title: titleController.text.trim(),
                    posterid: posterId,

                    blogImage: imagePicked!,
                  ),
                );
              }
            },
            icon: Icon(CupertinoIcons.check_mark),
          ),
        ],
      ),
      body: BlocConsumer<BlogBlocBloc, BlogBlocState>(
        listener: (context, state) {
          if (state is Blogblocfailure) {
            flushBar(context, state.message);
          }
          if (state is BlogblocSucess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Homescreen()),
              (r) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is BlogblocLoading) {
            return LoadingWidget();
          }
          return SingleChildScrollView(
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
                  BlogTextfield(
                    hintText: 'Blog Title',
                    maxLines: 1,
                    controller: titleController,
                  ),
                  SpaceH20(),
                  BlogTextfield(
                    hintText: 'Blog Description',
                    controller: contentController,
                  ),
                  SpaceH20(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
