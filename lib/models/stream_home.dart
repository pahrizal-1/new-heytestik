class StreamHomeModel {
  final int id;
  final String content;
  final String type;
  final String createdAt;
  final String visibility;
  final List<String> streamHashtags;
  final List<Map<String, dynamic>> streamPollOptions;
  final List<String> hashtags;
  final String fullname;
  final String photoUser;
  final String username;
  final int streamSaves;
  final int streamComments;
  final int streamLikes;
  final int streamCommentReplies;
  final bool saved;
  final bool liked;
  final int pollCount;
  final DateTime endTime;
  final List<String> postImage;

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
    required this.hashtags,
    required this.pollCount,
    required this.endTime,
    required this.postImage,
  });

  factory StreamHomeModel.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> dataPolling = json['stream_poll'] == null ? [] : (json['stream_poll']['stream_poll_options'] as List).map<Map<String, dynamic>>((e) => e).toList();
    List<Map<String, dynamic>> dataPollingSelected = json['stream_poll'] == null ? [] : (json['stream_poll']['stream_pollings'] as List).map<Map<String, dynamic>>((e) => e).toList();

    for (var i = 0; i < dataPolling.length; i++) {
      dataPolling[i]['count'] = 0;
      for (var j = 0; j < dataPollingSelected.length; j++) {
        if (dataPollingSelected[j]['stream_poll_option_id'] == dataPolling[i]['id']) {
          dataPolling[i]['count'] = dataPolling[i]['count'] + 1;
        }
      }
    }

    return StreamHomeModel(
      id: json['id'],
      content: json['content'],
      type: json['type'],
      createdAt: json['created_at'],
      visibility: json['visibility'],
      streamHashtags: (json['stream_hastags'] as List).map((e) => "#${e['hashtag']['tag']}").toList(),
      streamPollOptions: dataPolling,
      fullname: json['user']['fullname'],
      username: json['user']['username'] ?? "-",
      photoUser: json['user']['photo_profile'],
      streamSaves: json['_count']['stream_saves'],
      streamComments: json['_count']['stream_comments'],
      streamLikes: json['_count']['stream_likes'],
      streamCommentReplies: json['_count']['stream_comment_replies'],
      saved: json['saved'],
      liked: json['like'],
      hashtags: json['stream_hastags'] == null ? [] : (json['stream_hastags'] as List).map((e) => e['hashtag']['tag'].toString()).toList(),
      pollCount: json['stream_poll'] == null ? 0 : (json['stream_poll']['stream_pollings'] as List).length,
      endTime: json['stream_poll'] == null ? DateTime.now() : DateTime.parse(json['stream_poll']['end_time']),
      postImage: (json['media_streams'] as List).map((media) => media['media']['path'].toString()).toList(),
    );
  }
}
