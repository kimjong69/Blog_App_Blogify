class BlogModel {
  final String title;
  final String summary;
  final String blogUrl;
  final String imgUrl;

  BlogModel(
      {required this.title,
      required this.summary,
      required this.blogUrl,
      required this.imgUrl});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
        title: json['title'],
        summary: json['summary'],
        blogUrl: json['blogUrl'],
        imgUrl: json['imgUrl']);
  }
}
