import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide FormData;
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:heystetik_mobileapps/models/stream_comment.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/stream_comment_reply.dart';
import '../../../models/stream_home.dart';

class PostServices extends ProviderClass {
  PostServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> postPolling(StreamPostModel data) async {
    FormData formData = FormData.fromMap({
      "content": data.content,
      "type": data.type,
      "hashtags[]": data.hashtags,
      "stream_poll[end_time]": data.endTime,
      "stream_poll[options][]": data.options,
      "visibility": "PUBLIC"
    });

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

  Future<dynamic> postGeneral(StreamPostModel data) async {
    FormData formData = FormData.fromMap({
      "content": data.content,
      "type": data.type,
      "hashtags[]": data.hashtags,
      "visibility": "PUBLIC"
    });

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

  Future<List<StreamHomeModel>> getStreamHome(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/home',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List).map((e) => StreamHomeModel.fromJson(e)).toList();
    } catch(error) {
      print(error);
      return [];
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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

      return (response['data']['data'] as List).map((e) => StreamCommentModel.fromJson(e)).toList();
    } catch(error) {
      print(error);
      return [];
    }
  }

  Future<List<StreamCommentReplyModel>> getCommentReplies(int page, int postID, int commentID) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/$postID/comment/$commentID/replies',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List).map((e) => StreamCommentReplyModel.fromJson(e)).toList();
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
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
    } catch(error) {
      print(error);
    }
  }
}
