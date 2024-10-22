import 'dart:convert';

import 'package:app_test/controllers/posts.dart';
import 'package:app_test/models/posts.dart';
import 'package:app_test/utils/api_service.dart';
import 'package:app_test/utils/app_exceptions.dart';
import 'package:get/get.dart';

class PostsService {
  Future<List<PostsModel>> getAllPosts() async{
    final PostsController postsController = Get.find();

    try {
      var response = await ApiService().getRequest(
          "posts");
      // 如果响应已经是列表类型，不需要再 decode
      if (response is List<dynamic>) {
        print("====22222=======$response");

        // 将 response 映射到 PostsModel 列表
        List<PostsModel> posts = response.map((json) => PostsModel.fromJson(json)).toList();
        print("===444=======$posts");

        // 设置控制器中的帖子列表
        postsController.setPostsList(posts);
        return posts;
      } else {
        throw FetchDataException("Invalid response format");
      }
    } catch (exception) {
      print("get all posts err exception ${exception}");
      throw FetchDataException("something_went_wrong".tr);
    }
  }

}