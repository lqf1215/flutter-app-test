import 'dart:convert';

import 'package:app_test/components/posts/item.dart';
import 'package:app_test/controllers/posts_controller.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(builder: (postsController) {
      return NotificationListener(
        onNotification: (ScrollNotification notification) =>
            postsController.paginationData(notification: notification),
        child: ListView.builder(
          controller: postsController.scrollController,
          itemCount: postsController.postsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var postsData = postsController.postsList[index];
            return InkWell(
              onTap: () {
                print("postsData===${postsData.id}");
                postsController.setDetailPost(postsData);
                Get.toNamed(RouteConstants.postsDetailRoute);
              },
              child: PostsItem(
                userId: postsData.userId,
                id: postsData.id,
                body: postsData.body,
                title: postsData.title,
              ),
            );
          },
        ),
      );
    });
  }
}
