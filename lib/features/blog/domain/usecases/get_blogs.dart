import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/core/usecase/use_case.dart';
import 'package:blogapp/features/blog/domain/entities/blog.dart';
import 'package:blogapp/features/blog/domain/repository/blog_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepo blogRepo;

  GetBlogs(this.blogRepo);
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepo.getBlogs();
  }
}

class NoParams {}
