import 'dart:io';

import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/features/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepo {
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
  });
}
