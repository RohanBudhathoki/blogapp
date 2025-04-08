import 'dart:io';

import 'package:blogapp/core/error/exception.dart';
import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/features/blog/data/datasources/blog_data_sources.dart';
import 'package:blogapp/features/blog/data/models/blog_model.dart';
import 'package:blogapp/features/blog/domain/entities/blog.dart';
import 'package:blogapp/features/blog/domain/repository/blog_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase/supabase.dart' as sb;
import 'package:uuid/uuid.dart';

class BlogRepoImple implements BlogRepo {
  final BlogRemoteDataSources remoteDataSources;
  var uuid = Uuid();

  BlogRepoImple(this.remoteDataSources);

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: uuid.v1(),
        content: content,
        title: title,
        posterid: posterId,
        dateTime: DateTime.now(),
        blogImage: '',
      );
      final imageurl = await remoteDataSources.uploadImage(
        image: image,
        blog: blogModel,
      );
      blogModel = blogModel.copyWith(blogImage: imageurl);
      final uploadedBlog = await remoteDataSources.updateBlog(blogModel);
      if (uploadedBlog != null) {
        return right(uploadedBlog);
      } else {
        return left(Failure(message: "Failed to upload blog."));
      }
    } on sb.AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getBlogs() async {
    try {
      final blogs = await remoteDataSources.getBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
