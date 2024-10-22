import 'package:app_test/controllers/posts_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsDetail extends StatelessWidget {
  const PostsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(builder: (postController) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Text("Id:${postController.postDetailData.id}"),
            Text("Title:${postController.postDetailData.title}"),
            Text("Body:${postController.postDetailData.body}"),
          ]));
    });
  }
}
