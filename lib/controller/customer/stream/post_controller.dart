import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:heystetik_mobileapps/service/customer/stream/post.dart';

import '../../../models/stream_comment.dart';
import '../../../models/stream_comment_reply.dart';
import '../../../models/stream_home.dart';

class PostController extends StateClass {
  Future<dynamic> postGeneral(BuildContext context, StreamPostModel postModel, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = await PostServices().postGeneral(postModel);
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

  Future<dynamic> postPolling(BuildContext context, StreamPostModel postModel, {required Function() doInPost}) async {
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

  Future<List<StreamHomeModel>> getStreamHomeModel(BuildContext context, int page) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await PostServices().getStreamHome(page);
        isLoading.value = false;
      });

      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamCommentModel>> getComment(BuildContext context, int page, int postID) async {
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

  Future<List<StreamCommentReplyModel>> getCommentReplies(BuildContext context, int page, int postID, int commentID) async {
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

  void likeCommentReply(BuildContext context, int postID, int commentID, int replyID) async {
    try {
      isLoading.value = true;
      PostServices().likeCommentReply(postID, commentID, replyID);
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  void unlikeCommentReply(BuildContext context, int postID, int commentID, int replyID) async {
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
    } catch(error) {
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
