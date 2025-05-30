import 'dart:developer';

import 'package:blogapp/core/common/entities/user.dart';
import 'package:blogapp/core/common/widgets/loader.dart';
import 'package:blogapp/core/config/utils/utils.dart';
import 'package:blogapp/features/blog/presentation/add_blog/add_blog_screen.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  final User user;
  const Homescreen({super.key, required this.user});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    context.read<BlogBlocBloc>().add(FetchBlogData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddBlogScreen(userNAme: widget.user.name),
                ),
              );
            },
            icon: Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: BlocConsumer<BlogBlocBloc, BlogBlocState>(
        listener: (context, state) {
          if (state is Blogblocfailure) {
            flushBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is BlogblocLoading) {
            LoadingWidget();
          }
          if (state is BlogBlocDisplaySucess) {
            return GridView.builder(
              itemCount: state.bloc.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.network(state.bloc[index].blogImage),
                      ),
                      Text(state.bloc[index].title),
                      Text(state.bloc[index].content),
                      Text(state.bloc[index].userName),
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
