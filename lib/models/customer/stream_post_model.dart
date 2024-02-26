class StreamPostModel {
  final String content;

  final List<String?> hashtags;
  final DateTime endTime;
  final List<String> options;
  final String visibility;

  const StreamPostModel({
    required this.content,
    required this.hashtags,
    required this.endTime,
    required this.options,
    required this.visibility,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;

    data['hashtags'] = hashtags;
    data['options'] = options;
    data['endTime'] = endTime;
    data['visibility'] = visibility;
    return data;
  }
}
