class StreamCommentReplyModel {
  final int replyID;
  final String content;
  final String fullName;
  final String createdAt;
  final int like;

  const StreamCommentReplyModel({
    required this.replyID,
    required this.content,
    required this.fullName,
    required this.createdAt,
    required this.like,
  });

  factory StreamCommentReplyModel.fromJson(Map<String, dynamic> json) {
    return StreamCommentReplyModel(
      replyID: json['id'],
      content: json['content'],
      fullName: json['user']['fullname'],
      createdAt: json['created_at'],
      like: json['_count']['stream_comment_reply_likes'],
    );
  }
}
