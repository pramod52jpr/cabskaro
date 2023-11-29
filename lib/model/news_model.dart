class ArticleModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
  return ArticleModel(
    source: Source.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String? ?? '', 
    title: json['title'] as String? ?? '',   
    description: json['description'] as String? ?? '', 
    url: json['url'] as String? ?? '',       
    urlToImage: json['urlToImage'] as String? ?? '',
    publishedAt: json['publishedAt'] as String? ?? '',
    content: json['content'] as String? ?? '',
  );
}

}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String,
    );
  }
}

