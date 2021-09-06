import 'package:blog_app_flutter/models/liveNews.dart';
import 'package:flutter/material.dart';
import './reducer.dart';
import '../models/user.dart';
import '../models/post.dart';
import '../models/category.dart';
import '../models/editor.dart';

enum Types { ClearError, ClearUser, ClearLog, ClearReg, IsAuthenticated }

// Update Error Action
class UpdateErrorAction {
  String _error;

  String get error => this._error;

  UpdateErrorAction(this._error);
}

// Update user action
class UpdateUserAction {
  User _user;

  User get user => this._user;

  UpdateUserAction(this._user);
}

class GetUserAction {
  final User _user;

  User get user => this._user;

  GetUserAction(this._user);
}

class LogoutUserAction {
  final User _user;

  User get user => this._user;

  LogoutUserAction(this._user);
}

class GetPostAction {
  final List<Post> _post;

  List<Post> get posts => this._post;

  GetPostAction(this._post);
}

class GetCategoryAction {
  final List<Category> _category;

  List<Category> get categories => this._category;

  GetCategoryAction(this._category);
}

class GetNewsAction {
  final LiveNews _news;

  LiveNews get news => this._news;

  GetNewsAction(this._news);
}

class GetEditorAction {
  final Editor _editor;
  final List<Post> _post;
  final List<Category> _category;

  List<Category> get categories => this._category;
List<Post> get posts => this._post;
  Editor get editor => this._editor;

  GetEditorAction(this._editor,this._category,this._post);
}
