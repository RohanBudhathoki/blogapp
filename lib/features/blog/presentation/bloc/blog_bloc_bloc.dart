import 'dart:developer';
import 'dart:io';

import 'package:blogapp/features/blog/domain/entities/blog.dart';
import 'package:blogapp/features/blog/domain/usecases/get_blogs.dart';
import 'package:blogapp/features/blog/domain/usecases/update_blog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_bloc_event.dart';
part 'blog_bloc_state.dart';

class BlogBlocBloc extends Bloc<BlogBlocEvent, BlogBlocState> {
  final UpdateBlog _uploadBlog;
  final GetBlogs _getBlogs;
  BlogBlocBloc({required UpdateBlog uploadBlog, required GetBlogs getBlogs})
    : _getBlogs = getBlogs,
      _uploadBlog = uploadBlog,
      super(BlogBlocInitial()) {
    on<BlogBlocEvent>((event, emit) {
      BlogblocLoading();
    });
    on<BlogUpload>(_onBlogUpload);
    on<FetchBlogData>(_onGetBLog);
  }
  void _onBlogUpload(BlogUpload event, Emitter<BlogBlocState> emit) async {
    final res = await _uploadBlog(
      UpdateBlogParams(
        content: event.content,
        title: event.title,
        posterid: event.posterid,
        userName: event.userName,
        blogImage: event.blogImage,
      ),
    );

    res.fold(
      (l) => emit(Blogblocfailure(l.message)),
      (r) => emit(BlogblocSucess()),
    );
  }

  void _onGetBLog(FetchBlogData event, Emitter<BlogBlocState> emit) async {
    final res = await _getBlogs(NoParams());

    res.fold(
      (l) => emit(Blogblocfailure(l.message)),
      (r) => emit(BlogBlocDisplaySucess(r)),
    );
  }
}
