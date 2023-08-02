class StreamPostModel {
  final String content;
  final String type;
  final List<String?> hashtags;
  final DateTime endTime;
  final List<String> options;

  const StreamPostModel({
    required this.content,
    required this.type,
    required this.hashtags,
    required this.endTime,
    required this.options,
  });

  toJson() {
    return {
      "content": content,
      "type": type.toUpperCase(),
      "hashtags": hashtags,
      "stream_poll": {
        "end_time": endTime.toString(),
        "options": options,
      }
    };
  }
}
