import 'package:flutter/cupertino.dart';

class Editor {
  final String fullname, type, image;
  final int trending_count, bookmarked_count, favorite_count, awards_count;
  final List<EditorArticle> articles;


  Editor({
    required this.image,
    required this.fullname,
    required this.type,
    required this.trending_count,
    required this.bookmarked_count,
    required this.favorite_count,
    required this.awards_count,
    required this.articles,
  });

  factory Editor.fromJson(Map<String, dynamic> json) {
    return Editor(
      image: json['image'],
      articles: (json['articles'] as List)
          .map((i) => EditorArticle.fromJson(i))
          .toList(),
      bookmarked_count: json['bookmarked_count'],
      trending_count: json['trending_count'],
      fullname: json['fullname'],
      awards_count: json['awards_count'],
      favorite_count: json['favorite_count'],
      type: json['type'],
    );
  }
}

class EditorArticle {
  final String articleId, categoryId;

  EditorArticle({
    required this.articleId,
    required this.categoryId,
  });

  factory EditorArticle.fromJson(Map<String, dynamic> json) {
    return EditorArticle(
      articleId: json['articleId'],
      categoryId: json['categoryId'],
    );
  }
}



// class Editor {
//   String name;

//   Editor({required this.name});

//   factory Editor.fromJson(Map<String, dynamic> json) {
//     return Editor(
//       name: json['name'],
//     );
//   }
// }
