import 'dart:io';

import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/core/usecase/use_case.dart';

import 'package:blogapp/features/blog/domain/entities/blog.dart';
import 'package:blogapp/features/blog/domain/repository/blog_repo.dart';
import 'package:fpdart/fpdart.dart';

class UpdateBlog implements UseCase<Blog, UpdateBlogParams> {
  final BlogRepo blogRepo;

  UpdateBlog(this.blogRepo);

  @override
  Future<Either<Failure, Blog>> call(UpdateBlogParams params) async {
    return await blogRepo.uploadBlog(
      image: params.blogImage,
      title: params.title,
      content: params.content,
      posterId: params.posterid,
    );
  }
}

class UpdateBlogParams {
  final String content;
  final String title;
  final String posterid;
  final DateTime dateTime;
  final File blogImage;

  UpdateBlogParams({
    required this.content,
    required this.title,
    required this.posterid,
    required this.dateTime,
    required this.blogImage,
  });
}
