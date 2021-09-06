import 'package:flutter/cupertino.dart';
import 'dart:convert';

//LiveNews newsModelFromJson(String str) => LiveNews.fromJson(json.decode(str));

//String newsModelToJson(LiveNews data) => json.encode(data.toJson());

class LiveNews {
  String status;
  int totalResults;
  List<Article> results;

  LiveNews({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory LiveNews.fromJson(Map<String, dynamic> json){
   return LiveNews(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
           List<Article>.from(json["results"].map((x) => Article.fromJson(x))),
      );}

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Article {
  String title;
  String link;
  String image_url;
  String description;
  String source_id;
  String content;
  String pubDate;

  Article({
    required this.title,
    required this.link,
    required this.source_id,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.image_url,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
      title: json["title"],
      description: json["description"],
      link: json["link"],
      image_url: json["image_url"],
      pubDate: json["pubDate"],
      content: json["content"],
      source_id: json["source_id"]);

  Map<String, dynamic> toJson() => {
        "source_id": source_id,
        "title": title,
        "description": description,
        "link": link,
        "image_url": image_url,
        "pubDate": pubDate,
        "content": content,
      };
}
