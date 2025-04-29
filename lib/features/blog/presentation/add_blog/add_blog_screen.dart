import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blogapp/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:blogapp/core/common/widgets/loader.dart';
import 'package:blogapp/core/res/space.dart';
import 'package:blogapp/core/config/utils/pick_image.dart';
import 'package:blogapp/core/config/utils/utils.dart';
import 'package:blogapp/features/blog/presentation/add_blog/widget/blog_textfield.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBlogScreen extends StatefulWidget {
  final String userNAme;
  const AddBlogScreen({super.key, required this.userNAme});

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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<BlogBlocBloc>().add(FetchBlogData());
          },
          icon: Icon(Icons.arrow_back),
        ),
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
                    userName: widget.userNAme,
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
            context.read<BlogBlocBloc>().add(FetchBlogData());
            Navigator.pop(context);
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Center(
                        child:
                            imagePicked == null
                                ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(child: Text("Add Image")),
                                )
                                : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.file(
                                    imagePicked!,
                                    fit: BoxFit.cover,
                                  ),
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
