import 'dart:io';

import 'package:blogapp/core/error/exception.dart';
import 'package:blogapp/features/blog/data/models/blog_model.dart';
import 'package:supabase/supabase.dart';

abstract interface class BlogRemoteDataSources {
  Future<BlogModel?> updateBlog(BlogModel blog);
  Future<String> uploadImage({required File image, required BlogModel blog});
}

class BlogDataSourcesimpl implements BlogRemoteDataSources {
  final SupabaseClient supabaseClient;

  BlogDataSourcesimpl({required this.supabaseClient});

  @override
  Future<BlogModel> updateBlog(BlogModel blog) async {
    try {
      final blogData =
          await supabaseClient.from('blogs').insert(blog.tojson()).select();
      return BlogModel.fromjson(blogData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage({
    required File image,
    required BlogModel blog,
  }) async {
    try {
      await supabaseClient.storage
          .from('blogimage')
          .upload(blog.blogImage, image);

      return supabaseClient.storage
          .from('blogimage')
          .getPublicUrl(blog.blogImage);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
