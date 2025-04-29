import 'package:blogapp/features/blog/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.content,
    required super.title,
    required super.posterid,
    required super.dateTime,
    required super.blogImage,
    super.posterName,
    required super.userName,
  });
  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'id': id,
      'description': content,
      'title': title,
      'poster_id': posterid,
      'updated_at': dateTime.toIso8601String(),
      'blogimage': blogImage,
      'User': userName,
    };
  }

  factory BlogModel.fromjson(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as String,
      content: map['description'] as String,
      title: map['title'] as String,
      posterid: map['poster_id'] as String,
      dateTime:
          map['update_at'] == null
              ? DateTime.now()
              : DateTime.parse(map['updated_at']),
      blogImage: map['blogimage'] as String,
      userName: map['User'] as String,
    );
  }
  BlogModel copyWith({
    String? id,
    String? content,
    String? title,
    String? posterid,
    DateTime? dateTime,
    String? blogImage,
    String? posterName,
    String? userName,
  }) {
    return BlogModel(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      posterid: posterid ?? this.posterid,
      dateTime: dateTime ?? this.dateTime,
      blogImage: blogImage ?? this.blogImage,
      userName: userName ?? this.userName,
    );
  }
}
