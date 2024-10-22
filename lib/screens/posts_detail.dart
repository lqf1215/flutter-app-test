import 'dart:convert';

import 'package:app_test/components/posts/detail.dart';
import 'package:app_test/models/posts.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PostsDetailScreen extends StatefulWidget {
  const PostsDetailScreen({super.key});

  @override
  State<PostsDetailScreen> createState() =>
      _PostsDetailScreenState();
}

class _PostsDetailScreenState extends State<PostsDetailScreen> {
  String? postsDataJson;
  PostsModel? postsData;

  @override
  void initState() {
    postsDataJson = Get.arguments['postsData'];
    postsData = PostsModel.fromJson(jsonDecode(postsDataJson!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: const Text(
            "Posts Detail",
            style: CommonStyle.text_18_black,
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: PostsDetail(
          posts: postsData!,
        ));
  }
}
