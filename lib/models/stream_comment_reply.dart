class StreamCommentReplyModel {
  final int replyID;
  final String content;
  final String photoUser;
  final String fullName;
  final int userId;
  final String userName;
  final String createdAt;
  final int like;
  final bool liked;
  const StreamCommentReplyModel({
    required this.replyID,
    required this.content,
    required this.photoUser,
    required this.userName,
    required this.userId,
    required this.fullName,
    required this.createdAt,
    required this.like,
    required this.liked,
  });

  factory StreamCommentReplyModel.fromJson(Map<String, dynamic> json) {
    return StreamCommentReplyModel(
      replyID: json['id'],
      userId: json['user_id'],
      content: json['content'],
      photoUser: json['user']['media_user_profile_picture'] != null
          ? json['user']['media_user_profile_picture']['media']['path']
          : "",
      fullName: json['user']['fullname'],
      userName: json['user']['username'],
      createdAt: json['created_at'],
      liked: json['like'],
      like: json['_count']['stream_comment_reply_likes'],
    );
  }
}
