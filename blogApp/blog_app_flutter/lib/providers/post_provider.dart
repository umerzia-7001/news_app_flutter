import '../models/post.dart';
import '../services/api.dart';
import 'package:flutter/material.dart';

// class postProvider extends ChangeNotifier {
//   List<Post> _posts;
//   Post _singlePost;
//   Api _api = Api();

//   postProvider({
//     posts,
//     singlePost,
//     status,
//     api,
//   })  : _posts = posts,
//         _singlePost = singlePost,
//         _api = api;

//   set posts(List<Post> posts) => _posts = posts;
//   set singlePost(Post singlePost) => _singlePost = singlePost;

//   List<Post> get posts => _posts;
//   Post get singlePost => _singlePost;

//   getPosts() async {
//     _posts = await _api.getPosts();

//     notifyListeners();
//   }

//   getSinglePost(String id) async {
//     _singlePost = await getSinglePost(id);

//     notifyListeners();
//   }
// }
