class Blog {
  final String id;
  final String content;
  final String title;
  final String posterid;
  final DateTime dateTime;
  final String blogImage;

  Blog({
    required this.dateTime,
    required this.blogImage,
    required this.id,
    required this.content,
    required this.title,
    required this.posterid,
  });
}
