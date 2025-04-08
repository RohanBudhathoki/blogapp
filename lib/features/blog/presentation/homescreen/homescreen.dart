import 'package:blogapp/core/common/widgets/loader.dart';
import 'package:blogapp/core/utils/utils.dart';
import 'package:blogapp/features/blog/presentation/add_blog/add_blog_screen.dart';
import 'package:blogapp/features/blog/presentation/bloc/blog_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddBlogScreen()),
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
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.network('${state.bloc[index].blogImage}'),
                      ),
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
