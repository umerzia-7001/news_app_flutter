import 'dart:math';
import '/strings.dart';
import 'package:blog_app_flutter/models/category.dart';
import 'package:blog_app_flutter/models/editor.dart';
import 'package:blog_app_flutter/models/liveNews.dart';
import 'package:blog_app_flutter/models/post.dart';
import 'package:blog_app_flutter/services/api.dart';
import 'package:blog_app_flutter/store/reducer.dart';
import 'package:flutter/material.dart';
import "package:redux/redux.dart";
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import '../types.dart';

final String _baseURL = strings.localURL;
final String _newsURL = strings.newsURL;

final _api = Api();

ThunkAction<AppState> getPosts = (Store<AppState> store) async {
  List<Post> _posts;

  _posts = await _api.getPosts();
  store.dispatch(GetPostAction(_posts));
};

ThunkAction<AppState> getCategory = (Store<AppState> store) async {
  final List<Category> _categories;

  _categories = await _api.getCategories();

  store.dispatch(GetCategoryAction(_categories));
};

ThunkAction<AppState> getNews = (Store<AppState> store) async {
  final response = await http.get("$_newsURL");

  var jsonMap = LiveNews.fromJson(json.decode(response.body));
  print(response.body);

  store.dispatch(GetNewsAction(jsonMap));
};

// ignore: camel_case_types
class getEditorAct extends CallableThunkAction<AppState> {
  getEditorAct(this.id);

  final String id;

  @override
  call(Store<AppState> store) async {
    final Editor _editor = Editor(
        fullname: 'umer',
        type: 'news',
        image: '',
        articles: [],
        trending_count: 1,
        bookmarked_count: 3,
        favorite_count: 2,
        awards_count: 1);

    List<Post> _posts;
    List<Category> _categories;

    print(" cat, post,editor to send");
    _posts = await _api.getSpecificEditorPosts(id);
    // _editor = await _api.getEditor(id);
    _categories = await _api.getCategories();

    print(" cat, post,editor RECIEVING");

    store.dispatch(GetEditorAction(_editor, _categories, _posts));
  }
}
