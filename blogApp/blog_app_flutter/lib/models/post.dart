class Post {
  final String title,
      media,
      content,
      type,
      authorId,
      categoryName,
      authorName,
      date,
      id;
  final bool isTrending;

  Post({
    required this.id,
    required this.title,
    required this.media,
    required this.content,
    required this.type,
    required this.authorId,
    required this.categoryName,
    required this.authorName,
    required this.date,
    required this.isTrending,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      categoryName: json['categoryName'],
      content: json['content'],
      date: json['date'],
      isTrending: json['isTrending'],
      media: json['media'],
      title: json['title'],
      type: json['type'],
    );
  }
}
