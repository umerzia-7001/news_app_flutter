import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/editor.dart';
import '../models/post.dart';

abstract class NewsApi {
  Future<List<Post>> getPosts();

  Future<Post> getSinglePost(String id);

  Future<List<Post>> getSpecificEditorPosts(String userId);

  Future<Editor> getEditor(String id);

  Future<List<Category>> getCategories();
}