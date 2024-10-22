import 'package:app_test/models/posts.dart';
import 'package:app_test/services/posts_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PostsController extends GetxController {
  List<PostsModel> postsList = [];
  PostsModel postDetailData = PostsModel();
  bool isPostsList = false;
  final ScrollController scrollController = ScrollController();
  int page = 1;

  bool paginationData({required Notification notification}) {
    if (notification is ScrollUpdateNotification) {
      if (!isPostsList &&
          scrollController.position.maxScrollExtent ==
              scrollController.position.pixels) {
        if (getNextPage() > 0) {
          PostsService().getAllPosts();
        }
        return true;
      }
    }
    return false;
  }

  getNextPage() {
    return page;
  }

  resetPageNumber() {
    page = 1;
    update();
  }

  setPostsList(List<PostsModel> data) {
    postsList = data;
    update();
  }

  setDetailPost(PostsModel data) {
    postDetailData = data;
    update();
  }
}
