class NewsHeadline {
  final String title;
  final String description;
  final String publishedAt;
  final String urlToImage;
  final String source;

  NewsHeadline(
      {this.title,
      this.description,
      this.publishedAt,
      this.urlToImage,
      this.source});

  factory NewsHeadline.fromJSON(Map<String, dynamic> json) {
    return NewsHeadline(
        title: json['title'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        urlToImage: json['urlToImage'],
        source: json['source']['name']);
  }
}
