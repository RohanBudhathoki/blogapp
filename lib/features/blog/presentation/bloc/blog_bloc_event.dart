part of 'blog_bloc_bloc.dart';

@immutable
sealed class BlogBlocEvent {}

final class BlogUpload extends BlogBlocEvent {
  final String content;
  final String title;
  final String posterid;

  final File blogImage;

  BlogUpload({
    required this.content,
    required this.title,
    required this.posterid,

    required this.blogImage,
  });
}
