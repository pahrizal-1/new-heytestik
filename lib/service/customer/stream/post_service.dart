import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide FormData;
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post_model.dart';
import 'package:heystetik_mobileapps/models/stream_image_recent_model.dart';
import 'package:heystetik_mobileapps/models/stream_comment.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/stream_comment_reply.dart';
import '../../../models/stream_home.dart';

class PostServices extends ProviderClass {
  PostServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<StreamRecentImageModel> getRecentImage(int page) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
    };

    var response = await networkingConfig.doGet(
      '/stream/recent',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return StreamRecentImageModel.fromJson(response);
  }

  Future<dynamic> postStream(StreamPostModel data, {List? files}) async {
    Map<String, dynamic> params = {
      "content": data.content,
      "stream_poll[end_time]": data.options.isNotEmpty ? data.endTime : null,
      "stream_poll[options][]": data.options,
      "visibility": data.visibility,
    };
    if (data.hashtags.isNotEmpty) {
      params['hashtags[]'] = data.hashtags;
    }
    print("params $params");
    print("files $files");
    FormData formData = FormData.fromMap(params);

    if (files != null) {
      for (var file in files) {
        formData.files.addAll([
          MapEntry("files", await MultipartFile.fromFile(file)),
        ]);
      }
    }
    print("files $files");
    print("formData $formData");

    var response = await networkingConfig.doPost(
      '/stream',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<List<StreamHomeModel>> getStreamInterest(int page,
      {String? search}) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
      };

      if (search != null) {
        params.addAll({
          "search": search,
        });
      }

      var response = await networkingConfig.doGet(
        '/stream/interest',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getStreamInterest ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamFollowed(int page,
      {String? search}) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
      };

      if (search != null) {
        params.addAll({
          "search": search,
        });
      }

      var response = await networkingConfig.doGet(
        '/stream/followed',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getStreamFollowed ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getTrendingStream(int page,
      {String? search}) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
      };

      if (search != null) {
        params.addAll({
          "search": search,
        });
      }

      var response = await networkingConfig.doGet(
        '/stream/trending',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getTrendingStream ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamHome(int page,
      {String? search}) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
      };

      if (search != null) {
        params.addAll({
          "search": search,
        });
      }

      var response = await networkingConfig.doGet(
        '/stream/home',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getStreamHome ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamByHashtag(int page,
      {String? search, String? hashtag}) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
      };

      if (search != null) {
        params.addAll({
          "search": search,
        });
      }

      var response = await networkingConfig.doGet(
        '/stream/hashtag/$hashtag',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getStreamByHashtag ${error.toString()}");
      return [];
    }
  }

  Future<StreamHomeModel> getStreamById(int postId) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/$postId',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return StreamHomeModel.fromJson(response['data']);
    } catch (error) {
      print("getStreamById SER ${error.toString()}");
      return StreamHomeModel.fromJson({});
    }
  }

  void followPost(int postID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/follow-this-post',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("followPost ${error.toString()}");
    }
  }

  void unFollowPost(int postID) async {
    try {
      var response = await networkingConfig.doDelete(
        '/stream/$postID/unfollow-this-post',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unFollowPost ${error.toString()}");
    }
  }

  void likePost(int postID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/like',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("likePost ${error.toString()}");
    }
  }

  void unlikePost(int postID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/unlike',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unlikePost ${error.toString()}");
    }
  }

  void pickPolling(int streamID, int pollingID, int optionID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/polling',
        data: {
          "stream_id": streamID,
          "stream_poll_id": pollingID,
          "stream_poll_option_id": optionID,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("pickPolling ${error.toString()}");
    }
  }

  void deletePolling(int streamID, int pollingID, int optionID) async {
    try {
      var response = await networkingConfig.doDelete(
        '/stream/polling',
        data: {
          "stream_id": streamID,
          "stream_poll_id": pollingID,
          "stream_poll_option_id": optionID,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("deletePolling ${error.toString()}");
    }
  }

  Future<List<StreamCommentModel>> getComment(int page, int postID) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/$postID/comments',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamCommentModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getComment ${error.toString()}");

      return [];
    }
  }

  Future<List<StreamCommentReplyModel>> getCommentReplies(
      int page, int postID, int commentID) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/$postID/comment/$commentID/replies',
        params: {
          "page": page,
          "take": 100,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamCommentReplyModel.fromJson(e))
          .toList();
    } catch (error) {
      print("getCommentReplies ${error.toString()}");
      return [];
    }
  }

  void likeComment(int postID, int commentID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/comment/$commentID/like',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("likeComment ${error.toString()}");
    }
  }

  void unlikeComment(int postID, int commentID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/comment/$commentID/unlike',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unlikeComment ${error.toString()}");
    }
  }

  void likeCommentReply(int postID, int commentID, int replyID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/comment/$commentID/reply/$replyID/like',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("likeCommentReply ${error.toString()}");
    }
  }

  void unlikeCommentReply(int postID, int commentID, int replyID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/comment/$commentID/reply/$replyID/unlike',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unlikeCommentReply ${error.toString()}");
    }
  }

  void savePost(int postID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/save',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("savePost ${error.toString()}");
    }
  }

  void unSavePost(int postID) async {
    try {
      var response = await networkingConfig.doPost(
        '/stream/$postID/unsave',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unSavePost ${error.toString()}");
    }
  }

  void postComment(int postID, String content) async {
    try {
      // Regular expression to match mentions starting with "@"
      RegExp mentionRegex = RegExp(r'@(\w+)');

      // Find all matches in the text
      Iterable<RegExpMatch> matches = mentionRegex.allMatches(content);

      // Extract the mention usernames and store them in a list
      List<String> mentions = matches.map((match) => match.group(1)!).toList();

      List<Map<String, dynamic>> userMentions = [];

      for (var i = 0; i < mentions.length; i++) {
        userMentions
            .add({"username": mentions[i], "mention": "@${mentions[i]}"});
      }

      print(userMentions);

      Map<String, dynamic> data = {
        "content": content,
        // "mentions": userMentions,
      };

      var response = await networkingConfig.doPost(
        '/stream/$postID/comment',
        data: data,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("postComment ${error.toString()}");
    }
  }

  void blockUser(String username) async {
    try {
      var response = await networkingConfig.doPost(
        '/user-block/$username/block',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("blockUser ${error.toString()}");
    }
  }

  void unBlockUser(String username) async {
    try {
      var response = await networkingConfig.doPost(
        '/user-block/$username/unblock',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
    } catch (error) {
      print("unBlockUser ${error.toString()}");
    }
  }
}
