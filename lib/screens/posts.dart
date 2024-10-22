import 'package:app_test/controllers/posts_controller.dart';
import 'package:app_test/custom_widgets/appbar/app_bar.dart';
import 'package:app_test/services/posts_service.dart';
import 'package:app_test/utils/color_constants.dart';
import 'package:app_test/utils/common_style.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/error.dart';
import '../custom_widgets/post_list/posts_list.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsController postsController = Get.put(PostsController());
  late Future postsFuture;

  @override
  void initState() {
    postsFuture = PostsService().getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: customAppbar(title: "Posts"),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02, vertical: size.height * 0.01),
          child: RefreshIndicator(
            color: ColorConstants.primaryColor,
            onRefresh: () async {
              postsFuture = PostsService().getAllPosts();
            },
            child: FutureBuilder<dynamic>(
              future: postsFuture,
              builder: (BuildContext context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasData) {
                      return postsController.postsList.isNotEmpty
                          ? const PostsList()
                          : const Center(
                              child: Text(
                              "No Data Found",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: ShowError(
                        onRetryPressed: () {
                          postsFuture = PostsService().getAllPosts();
                        },
                        errorMessage: "something_went_wrong".tr,
                      ));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                }
              },
            ),
          ),
        ));
  }
}
