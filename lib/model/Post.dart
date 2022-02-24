// ignore_for_file: file_names

class Post {
  final int pageid;
  final int ns;
  final String title;
  final String extract;

  Post(
      {required this.pageid,
      required this.ns,
      required this.title,
      required this.extract});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      pageid: json['query']['pages']['30589']['pageid'],
      ns: json['query']['pages']['30589']['ns'],
      title: json['query']['pages']['30589']['title'],
      extract: json['query']['pages']['30589']['extract'],
    );
  }
}
