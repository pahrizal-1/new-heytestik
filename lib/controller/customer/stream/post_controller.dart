import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:heystetik_mobileapps/service/customer/stream/post.dart';

class PostController extends StateClass {
  Future<dynamic> postPolling(BuildContext context, StreamPostModel postModel,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = await PostServices().postPolling(postModel.toJson());
        print(postModel.toJson());
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
}
