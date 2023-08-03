class StreamCommentModel {
  final int commentID;
  final String content;
  final String fullName;
  final String createdAt;
  final int like;
  final int comment;

  const StreamCommentModel({
    required this.commentID,
    required this.content,
    required this.fullName,
    required this.createdAt,
    required this.like,
    required this.comment,
  });

  factory StreamCommentModel.fromJson(Map<String, dynamic> json) {
    return StreamCommentModel(
      commentID: json['id'],
      content: json['content'],
      fullName: json['user']['fullname'],
      createdAt: json['created_at'],
      like: json['_count']['stream_comment_likes'],
      comment: json['_count']['stream_comment_replies'],
    );
  }
}
