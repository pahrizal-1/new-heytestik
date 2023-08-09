class UserActivity {
  final int id;
  final String content;
  final String category;
  final String createdAt;
  final int postSave;
  final int postComment;
  final int postLike;
  final int commentReplies;
  final List<String> hashtags;
  final String visibility;
  final List<Map<String, dynamic>> streamPolls;

  const UserActivity({
    required this.id,
    required this.content,
    required this.category,
    required this.createdAt,
    required this.postComment,
    required this.postSave,
    required this.postLike,
    required this.commentReplies,
    required this.hashtags,
    required this.visibility,
    required this.streamPolls,
  });

  factory UserActivity.fromJson(Map<String, dynamic> json) {
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

    return UserActivity(
      id: json['id'],
      content: json['content'],
      category: json['category'],
      createdAt: json['created_at'],
      postComment: json['_count']['stream_comments'],
      postSave: json['_count']['stream_saves'],
      postLike: json['_count']['stream_likes'],
      commentReplies: json['_count']['stream_comment_replies'],
      hashtags: (json['stream_hastags'] as List).map((e) => e['hashtag']['tag'].toString()).toList(),
      visibility: json['visibility'],
      streamPolls: dataPolling,
    );
  }
}
