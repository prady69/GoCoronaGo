class NewsHeadline {
  final String title;
  final String description;
  final String content;
  final String url;
  final String publishedAt;
  final String urlToImage;
  final String source;

  NewsHeadline(
      {this.title,
      this.description,
      this.publishedAt,
      this.urlToImage,
      this.source,
      this.content,
      this.url});

  factory NewsHeadline.fromJSON(Map<String, dynamic> json) {
    return NewsHeadline(
        title: json['title'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        urlToImage: json['urlToImage'],
        source: json['source']['name'],
        content: json['content'],
        url: json['url']);
  }
}
