import 'dart:io';

import 'package:blogapp/features/blog/domain/usecases/update_blog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_bloc_event.dart';
part 'blog_bloc_state.dart';

class BlogBlocBloc extends Bloc<BlogBlocEvent, BlogBlocState> {
  final UpdateBlog uploadBlog;
  BlogBlocBloc(this.uploadBlog) : super(BlogBlocInitial()) {
    on<BlogBlocEvent>((event, emit) {
      BlogblocLoading();
    });
    on<BlogUpload>(_onBlogUpload);
  }
  void _onBlogUpload(BlogUpload event, Emitter<BlogBlocState> emit) async {
    final res = await uploadBlog(
      UpdateBlogParams(
        id: event.id,
        content: event.content,
        title: event.title,
        posterid: event.posterid,
        dateTime: event.dateTime,
        blogImage: event.blogImage,
      ),
    );
    res.fold(
      (l) => emit(Blogblocfailure(l.message)),
      (r) => emit(BlogblocSucess()),
    );
  }
}
