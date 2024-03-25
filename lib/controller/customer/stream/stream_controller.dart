import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post_model.dart';
import 'package:heystetik_mobileapps/models/stream_image_recent_model.dart';
import 'package:heystetik_mobileapps/service/customer/stream/stream_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../../models/stream_comment.dart';
import '../../../models/stream_comment_reply.dart';
import '../../../models/stream_home.dart';

class StreamController extends StateClass {
  RxString search = "".obs;
  RxList<StreamHomeModel> homeStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> followedStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> trendingStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> interestStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> savedStreams = List<StreamHomeModel>.empty().obs;
  RxList<StreamHomeModel> streamsByHashtag = List<StreamHomeModel>.empty().obs;
  RxInt homeStreamIndex = 1.obs;
  RxInt interestStreamIndex = 1.obs;
  RxInt followedStreamIndex = 1.obs;
  RxInt trendingStreamIndex = 1.obs;
  RxInt savedStreamIndex = 1.obs;
  RxInt streamsByHashtagIndex = 1.obs;
  RxList<Data2> recentImage = List<Data2>.empty().obs;

  Future<List<Data2>> getRecentImage(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var get = await StreamService().getRecentImage(page);
      recentImage.value = get.data!.data!;
    });
    isLoading.value = false;
    return recentImage;
  }

  Future<dynamic> postStream(
    BuildContext context,
    StreamPostModel postModel, {
    required Function() doInPost,
    List? files,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = await StreamService().postStream(postModel, files: files);
        print("data $data");
        doInPost();
      } catch (e) {
        print("postStream ${e.toString()}");
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: "Something wen't wrong please try again later",
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
        data = await StreamService()
            .getStreamFollowed(followedStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      followedStreams.addAll(data);
      return data;
    } catch (error) {
      print("getStreamFollowed ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamInterest(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService()
            .getStreamInterest(interestStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      interestStreams.addAll(data);
      return data;
    } catch (error) {
      print("getStreamInterest ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getTrendingStream(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService()
            .getTrendingStream(trendingStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      trendingStreams.addAll(data);
      return data;
    } catch (error) {
      print("getTrendingStream ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamHome(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService()
            .getStreamHome(homeStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      homeStreams.addAll(data);
      return data;
    } catch (error) {
      print("getStreamHome ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getSavedStream(BuildContext context) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService()
            .getSavedStream(savedStreamIndex.value, search: search.value);
        isLoading.value = false;
      });

      savedStreams.addAll(data);
      return data;
    } catch (error) {
      print("getSavedStream ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamHomeModel>> getStreamByHashtag(
      BuildContext context, String hashtag) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService().getStreamByHashtag(
            streamsByHashtagIndex.value,
            search: search.value,
            hashtag: hashtag);
        isLoading.value = false;
      });

      streamsByHashtag.addAll(data);
      return data;
    } catch (error) {
      print("getStreamByHashtag ${error.toString()}");
      return [];
    }
  }

  Future<StreamHomeModel?> getStreamById(
      BuildContext context, int postId) async {
    try {
      // isLoading.value = true;
      StreamHomeModel? data;
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService().getStreamById(postId);
        // isLoading.value = false;
      });

      return data;
    } catch (error) {
      print("getStreamById ${error.toString()}");
      return StreamHomeModel.fromJson({});
    }
  }

  Future<List<StreamCommentModel>> getComment(
      BuildContext context, int page, int postID) async {
    try {
      // isLoading.value = true;
      List<StreamCommentModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        await Future.delayed(Duration(seconds: 1));
        data = await StreamService().getComment(page, postID);
        // isLoading.value = false;
      });

      return data;
    } catch (error) {
      print("getComment ${error.toString()}");
      return [];
    }
  }

  Future<List<StreamCommentReplyModel>> getCommentReplies(
      BuildContext context, int page, int postID, int commentID) async {
    try {
      // isLoading.value = true;
      List<StreamCommentReplyModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await StreamService().getCommentReplies(page, postID, commentID);
        // isLoading.value = false;
      });

      return data;
    } catch (error) {
      print("getCommentReplies ${error.toString()}");
      return [];
    }
  }

  void followPost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().followPost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("followPost ${error.toString()}");
    }
  }

  void unFollowPost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().unFollowPost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("unFollowPost ${error.toString()}");
    }
  }

  void likePost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().likePost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("likePost ${error.toString()}");
    }
  }

  void unlikePost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().unlikePost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("unlikePost ${error.toString()}");
    }
  }

  void pickPolling(
      BuildContext context, int streamID, int pollingID, int optionID) async {
    try {
      // isLoading.value = true;
      StreamService().pickPolling(streamID, pollingID, optionID);
      // isLoading.value = false;
    } catch (error) {
      print("pickPolling ${error.toString()}");
    }
  }

  void deletePolling(
      BuildContext context, int streamID, int pollingID, int optionID) async {
    try {
      // isLoading.value = true;
      StreamService().deletePolling(streamID, pollingID, optionID);
      // isLoading.value = false;
    } catch (error) {
      print("deletePolling ${error.toString()}");
    }
  }

  void savePost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().savePost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("savePost ${error.toString()}");
    }
  }

  void unSavePost(BuildContext context, int postID) async {
    try {
      // isLoading.value = true;
      StreamService().unSavePost(postID);
      // isLoading.value = false;
    } catch (error) {
      print("unSavePost ${error.toString()}");
    }
  }

  void likeComment(BuildContext context, int postID, int commentID) async {
    try {
      // isLoading.value = true;
      StreamService().likeComment(postID, commentID);
      // isLoading.value = false;
    } catch (error) {
      print("likeComment ${error.toString()}");
    }
  }

  void unlikeComment(BuildContext context, int postID, int commentID) async {
    try {
      // isLoading.value = true;
      StreamService().unlikeComment(postID, commentID);
      // isLoading.value = false;
    } catch (error) {
      print("unlikeComment ${error.toString()}");
    }
  }

  void likeCommentReply(
      BuildContext context, int postID, int commentID, int replyID) async {
    try {
      // isLoading.value = true;
      StreamService().likeCommentReply(postID, commentID, replyID);
      // isLoading.value = false;
    } catch (error) {
      print("likeCommentReply ${error.toString()}");
    }
  }

  void unlikeCommentReply(
      BuildContext context, int postID, int commentID, int replyID) async {
    try {
      // isLoading.value = true;
      StreamService().unlikeCommentReply(postID, commentID, replyID);
      // isLoading.value = false;
    } catch (error) {
      print("unlikeCommentReply ${error.toString()}");
    }
  }

  void postComment(BuildContext context, int postID, String comment) async {
    try {
      // isLoading.value = true;
      StreamService().postComment(postID, comment);
      // isLoading.value = false;
    } catch (error) {
      print("postComment ${error.toString()}");
    }
  }

  void blockUser(BuildContext context, String username) async {
    try {
      // isLoading.value = true;
      StreamService().blockUser(username);
      SnackbarWidget.getBlockSnackbar(
        context,
        'Block',
        username,
      );
      // isLoading.value = false;
    } catch (error) {
      print("blockUser ${error.toString()}");
    }
  }

  void unBlockUser(BuildContext context, String username) async {
    try {
      // isLoading.value = true;
      StreamService().unBlockUser(username);
      SnackbarWidget.getBlockSnackbar(
        context,
        'UnBlock',
        username,
      );
      // isLoading.value = false;
    } catch (error) {
      print("unBlockUser ${error.toString()}");
    }
  }

  void followUser(BuildContext context, String username) async {
    try {
      // isLoading.value = true;
      StreamService().followUser(username);
      // isLoading.value = false;
    } catch (error) {
      print("followUser ${error.toString()}");
    }
  }

  void unFollowUser(BuildContext context, String username) async {
    try {
      // isLoading.value = true;
      StreamService().unFollowUser(username);
      // isLoading.value = false;
    } catch (error) {
      print("unFollowUser ${error.toString()}");
    }
  }

  Future<void> reportUser(BuildContext context, int streamId,
      String reportReason, String reportDetail,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "stream_id": streamId,
        "report_reason": reportReason,
        "report_detail": reportDetail
      };
      await StreamService().reportUser(data);
      doInPost();
    });
    isLoading.value = false;
  }
}
