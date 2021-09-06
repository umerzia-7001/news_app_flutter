import 'dart:convert';
import 'package:blog_app_flutter/main.dart';
import './api_abs.dart';
import 'package:blog_app_flutter/store/types.dart';

import '../models/category.dart';
import '../models/editor.dart';
import '../models/post.dart';
import "package:http/http.dart" as http;


class Api implements NewsApi{
  final String _baseURL = "http://localhost:5000";

  final String newAPI =
      "https://newsdata.io/api/1/news?apikey=pub_894913f56223287c69e5d6db74bdf0ae61c&language=en";

  Future<List<Post>> getPosts() async {
    final response = await http.get("$_baseURL/posts");

  if (response.statusCode == 400) {
    print("status 400");
    final body = json.decode(response.body);

    store.dispatch(new UpdateErrorAction(body['msg']));
    print(body['msg']);
  }
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  final List<Post> post =
      parsed.map<Post>((json) => Post.fromJson(json)).toList();

  return post;
    
  }

  Future<Post> getSinglePost(String id) async {
    final response = await http.post(
      "$_baseURL/posts.id",
      body: json.encode(
        {'id': '$id'},
      ),
      headers: {'Content-Type': "application/json"},
    );

    if (response.statusCode != 200) {
      final body = json.decode(response.body);

      if (body['msg'] != "") {
        store.dispatch(new UpdateErrorAction(body['msg']));
      }
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body).cast<Map<String, dynamic>>();
      final result = data.map<Post>((json) => Post.fromJson(json));

      return result;
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Post>> getSpecificEditorPosts(String userId) async {
    final response = await http.post(
      '$_baseURL/posts/user',
      body: json.encode(
        {'id': '$userId'},
      ),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode != 200) {
      final body = json.decode(response.body);

      if (body['msg'] != "") {
        store.dispatch(new UpdateErrorAction(body['msg']));
      }
    }

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  // Get Single Editor
  Future<Editor> getEditor(String id) async {
    final response = await http.post(
      '$_baseURL/editors/id',
      body: json.encode(
        {'id': '$id'},
      ),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode == 200) {
      return Editor.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Category>> getCategories() async {
    final response = await http.get('$_baseURL/categories');

    if (response.statusCode != 200) {
      final body = json.decode(response.body);

      if (body['msg'] != "") {
        store.dispatch(new UpdateErrorAction(body['msg']));
      }
    }

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Category>((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }
}
