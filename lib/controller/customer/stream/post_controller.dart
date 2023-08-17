import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:heystetik_mobileapps/service/customer/stream/post.dart';

import '../../../models/stream_comment.dart';
import '../../../models/stream_comment_reply.dart';
import '../../../models/stream_home.dart';

class PostController extends StateClass {
  RxString search = "".obs;
  RxList<StreamHomeModel> homeStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> followedStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> trendingStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> interestStreams = List<StreamHomeModel>.empty().obs;
  RxInt homeStreamIndex = 1.obs;
  RxInt interestStreamIndex = 1.obs;
  RxInt followedStreamIndex = 1.obs;
  RxInt trendingStreamIndex = 1.obs;

  Future<dynamic> postGeneral(
    BuildContext context,
    StreamPostModel postModel, {
    required Function() doInPost,
    List<File>? files,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = await PostServices().postGeneral(postModel, files: files);
        print(data);
        doInPost();
      } catch (e) {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: "Something wen't wromg please try again later",
        );
      }
    });
    isLoading.value = false;
  }

  Future<dynamic> postPolling(BuildContext context, StreamPostModel postModel,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = await PostServices().postPolling(postModel);
        doInPost();
      } catch (e) {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: "Something wen't wromg please try again later",
        );
      }
    });
    isLoading.value = false;
  }

  Future<List<StreamHomeModel>> getStreamFollowed(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices()
            .getStreamFollowed(followedStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      followedStreams.addAll(data);
      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamInterest(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices()
            .getStreamInterest(interestStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      interestStreams.addAll(data);
      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamHomeModel>> getTrendingStream(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices()
            .getTrendingStream(trendingStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      trendingStreams.addAll(data);
      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamHomeModel(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices()
            .getStreamHome(homeStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      homeStreams.addAll(data);
      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamCommentModel>> getComment(
      BuildContext context, int page, int postID) async {
    try {
      isLoading.value = true;
      List<StreamCommentModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices().getComment(page, postID);
        isLoading.value = false;
      });

      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamCommentReplyModel>> getCommentReplies(
      BuildContext context, int page, int postID, int commentID) async {
    try {
      isLoading.value = true;
      List<StreamCommentReplyModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices().getCommentReplies(page, postID, commentID);
        isLoading.value = false;
      });

      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  void likePost(BuildContext context, int postID) async {
    try {
      isLoading.value = true;
      PostServices().likePost(postID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unlikePost(BuildContext context, int postID) async {
    try {
      isLoading.value = true;
      PostServices().unlikePost(postID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void pickPolling(
      BuildContext context, int streamID, int pollingID, int optionID) async {
    try {
      isLoading.value = true;
      PostServices().pickPolling(streamID, pollingID, optionID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void deletePolling(
      BuildContext context, int streamID, int pollingID, int optionID) async {
    try {
      isLoading.value = true;
      PostServices().deletePolling(streamID, pollingID, optionID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void savePost(BuildContext context, int postID) async {
    try {
      isLoading.value = true;
      PostServices().savePost(postID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unSavePost(BuildContext context, int postID) async {
    try {
      isLoading.value = true;
      PostServices().unSavePost(postID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void likeComment(BuildContext context, int postID, int commentID) async {
    try {
      isLoading.value = true;
      PostServices().likeComment(postID, commentID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unlikeComment(BuildContext context, int postID, int commentID) async {
    try {
      isLoading.value = true;
      PostServices().unlikeComment(postID, commentID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void likeCommentReply(
      BuildContext context, int postID, int commentID, int replyID) async {
    try {
      isLoading.value = true;
      PostServices().likeCommentReply(postID, commentID, replyID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unlikeCommentReply(
      BuildContext context, int postID, int commentID, int replyID) async {
    try {
      isLoading.value = true;
      PostServices().unlikeCommentReply(postID, commentID, replyID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void postComment(BuildContext context, int postID, String comment) async {
    try {
      isLoading.value = true;
      PostServices().postComment(postID, comment);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void blockUser(BuildContext context, String username) async {
    try {
      isLoading.value = true;
      PostServices().blockUser(username);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unBlockUser(BuildContext context, String username) async {
    try {
      isLoading.value = true;
      PostServices().unBlockUser(username);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }
}
