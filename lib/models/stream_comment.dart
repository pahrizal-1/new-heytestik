class StreamCommentModel {
  final int commentID;
  final String content;
  final String photoUser;
  final int userId;
  final String userName;
  final String fullName;
  final String createdAt;
  final int like;
  final bool liked;
  final int commentReplies;

  const StreamCommentModel({
    required this.commentID,
    required this.content,
    required this.photoUser,
    required this.userId,
    required this.userName,
    required this.fullName,
    required this.createdAt,
    required this.like,
    required this.liked,
    required this.commentReplies,
  });

  factory StreamCommentModel.fromJson(Map<String, dynamic> json) {
    return StreamCommentModel(
      commentID: json['id'],
      userId: json['user_id'],
      content: json['content'],
      photoUser: json['user']['media_user_profile_picture'] != null
          ? json['user']['media_user_profile_picture']['media']['path']
          : "",
      fullName: json['user']['fullname'],
      userName: json['user']['username'],
      createdAt: json['created_at'],
      liked: json['like'],
      like: json['_count']['stream_comment_likes'],
      commentReplies: json['_count']['stream_comment_replies'],
    );
  }
}
