import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:heystetik_mobileapps/service/customer/stream/post.dart';

import '../../../models/stream_home.dart';

class PostController extends StateClass {
  Future<dynamic> postGeneral(BuildContext context, StreamPostModel postModel,
      {required Function() doInPost}) async {
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

  Future<List<StreamHomeModel>> getStreamHomeModel(
      BuildContext context, int page) async {
    isLoading.value = true;
    List<StreamHomeModel> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await PostServices().getStreamHome(page);

      isLoading.value = false;
    });

    return data;
  }
}
