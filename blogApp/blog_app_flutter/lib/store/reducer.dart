import 'package:blog_app_flutter/models/liveNews.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/post.dart';
import '../models/category.dart';
import '../models/editor.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './types.dart';

@immutable
class AppState {
  final String errorMsg;
  final User user;
  final List<Post> post;
  final Editor editor;
  final List<Category> category;
  final LiveNews news;

  AppState(
      {required this.user,
      required this.errorMsg,
      required this.post,
      required this.editor,
      required this.category,
      required this.news});

  factory AppState.initial() {
    return AppState(
        errorMsg: '',
        user: User(id: '', name: '', email: ''),
        post: [],
        category: [],
        news: LiveNews(status: '',totalResults: 1, results: []),
        editor: Editor(
            fullname: '',
            type: '',
            image: '',
            articles: [],
            trending_count: 1,
            bookmarked_count: 3,
            favorite_count: 1,
            awards_count: 1));
  }

  AppState copyWith({
    errorMsg,
    User? user,
    Post? post,
  }) {
    return AppState(
        errorMsg: errorMsg ?? this.errorMsg,
        user: user ?? this.user,
        post: this.post,
        editor: this.editor,
         news: this.news,
        category: this.category);
  }
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducer(state.user, action),
    errorMsg: errorReducer(action, state.errorMsg),
    post: postReducer(action, state.post),
    editor: editorReducer(action, state.editor),
    news: newsReducer(action,state.news),
    category: categoryReducer(action, state.category),
  );
}

User userReducer(User user, dynamic action) {
  if (action is GetUserAction) {
    return action.user;
  } else if (action is LogoutUserAction) {
    return action.user;
  }

  if (action is UpdateUserAction) {
    return action.user;
  }
  return user;
}

String errorReducer(dynamic action, String error) {
  if (action is UpdateErrorAction) {
    return action.error;
  }
  return error;
}

List<Post> postReducer(dynamic action, List<Post> post) {
  if (action is GetPostAction) {
    return action.posts;
  }
  return post;
}

List<Category> categoryReducer(dynamic action, List<Category> category) {
  if (action is GetCategoryAction) {
    return action.categories;
  }
  return category;
}
LiveNews newsReducer(dynamic action, LiveNews news) {
  if (action is GetNewsAction) {
    return action.news;
  }
  return news;
}

Editor editorReducer(dynamic action, Editor editor) {
  if (action is GetEditorAction) {
    return action.editor;
  }
  return editor;
}
