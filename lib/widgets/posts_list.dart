
import 'dart:convert';

import 'package:app_test/components/posts/item.dart';
import 'package:app_test/controllers/posts.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PostsController>(builder: (postsController) {
      return Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: (ScrollNotification notification) =>
                  postsController.paginationData(notification: notification),
              child: ListView.builder(
                controller: postsController.scrollController,
                itemCount:
                    postsController.postsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var postsData = postsController
                      .postsList[index];
                  return InkWell(
                    onTap: () {
                      print("postsData===${postsData.id}");
                      Get.toNamed(RouteConstants.postsDetailRoute,
                          arguments: {
                            "postsData": jsonEncode(postsData)
                          });
                    },
                    child: PostsItem(
                      userId: postsData.userId,
                      id:  postsData.id,
                      body: postsData.body,
                      title: postsData.title,
                    ),
                  );
                },
              ),
            ),
          ),
          postsController.isPostsList
              ? Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.transparent,
                  child: const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstants.primaryColor)))
              : Container()
        ],
      );
    });
  }
}
