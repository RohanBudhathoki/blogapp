// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  final String id;
  final String content;
  final String title;
  final String posterid;
  final DateTime dateTime;
  final String blogImage;
  final String? posterName;

  Blog({
    required this.dateTime,
    required this.blogImage,
    required this.id,
    required this.content,
    required this.title,
    required this.posterid,
    this.posterName,
  });
}
