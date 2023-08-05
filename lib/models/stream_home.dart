class StreamHomeModel {
  final int id;
  final String content;
  final String type;
  final String createdAt;
  final String visibility;
  final List<String> streamHashtags;
  final List<String> streamPollOptions;
  final String fullname;
  final String photoUser;
  final String username;
  final int streamSaves;
  final int streamComments;
  final int streamLikes;
  final int streamCommentReplies;
  final bool saved;
  final bool liked;

  const StreamHomeModel({
    required this.id,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.visibility,
    required this.streamHashtags,
    required this.streamPollOptions,
    required this.fullname,
    required this.username,
    required this.photoUser,
    required this.streamSaves,
    required this.streamComments,
    required this.streamLikes,
    required this.streamCommentReplies,
    required this.saved,
    required this.liked,
  });

  factory StreamHomeModel.fromJson(Map<String, dynamic> json) {
    return StreamHomeModel(
      id: json['id'],
      content: json['content'],
      type: json['type'],
      createdAt: json['created_at'],
      visibility: json['visibility'],
      streamHashtags: (json['stream_hastags'] as List).map((e) => "#${e['hashtag']['tag']}").toList(),
      streamPollOptions: json['stream_poll'] == null ? [] : (json['stream_poll']['stream_poll_options'] as List).map((e) => e['option'].toString()).toList(),
      fullname: json['user']['fullname'],
      username: json['user']['username'] ?? "-",
      photoUser: json['user']['photo_profile'],
      streamSaves: json['_count']['stream_saves'],
      streamComments: json['_count']['stream_comments'],
      streamLikes: json['_count']['stream_likes'],
      streamCommentReplies: json['_count']['stream_comment_replies'],
      saved: json['saved'],
      liked: json['like'],
    );
  }
}
