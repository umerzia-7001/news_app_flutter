import 'package:blog_app_flutter/models/liveNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class NewsController extends GetxController {
//   RxList<LiveNews> liveNews = <LiveNews>[].obs;
 
//  Rx<LiveNews> jsonMap = LiveNews(status: '',totalResults: 1, results: []).obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getNews();
//   }

//   Future<LiveNews> getNews() async {
//     var client = http.Client();
//     var newsModel;

//        final response = await http.get("https://newsdata.io/api/1/news?apikey=pub_894913f56223287c69e5d6db74bdf0ae61c&language=en");
      

//         var jsonMap = LiveNews.fromJson(json.decode(response.body));
//         print(response.body);
//         print(jsonMap);
//     return jsonMap;
//   }
// }
