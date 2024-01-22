class StreamCommentReplyModel {
  final int replyID;
  final String content;
  final String photoUser;
  final String fullName;
  final String createdAt;
  final int like;

  const StreamCommentReplyModel({
    required this.replyID,
    required this.content,
    required this.photoUser,
    required this.fullName,
    required this.createdAt,
    required this.like,
  });

  factory StreamCommentReplyModel.fromJson(Map<String, dynamic> json) {
    return StreamCommentReplyModel(
      replyID: json['id'],
      content: json['content'],
      photoUser: json['user']['media_user_profile_picture'] != null
          ? json['user']['media_user_profile_picture']['media']['path']
          : "",
      fullName: json['user']['fullname'],
      createdAt: json['created_at'],
      like: json['_count']['stream_comment_reply_likes'],
    );
  }
}
