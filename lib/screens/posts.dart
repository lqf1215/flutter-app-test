import 'package:app_test/controllers/posts.dart';
import 'package:app_test/services/posts.dart';
import 'package:app_test/utils/color_constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:app_test/widgets/error.dart';
import 'package:app_test/widgets/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>{
  late Future postsFuture;

  @override
  void initState() {
    postsFuture = PostsService().getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Posts",
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
        backgroundColor: Colors.white,
        body:
        GetBuilder<PostsController>(builder: (postsController) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.01),
                      child: RefreshIndicator(
                        color: ColorConstants.primaryColor,
                        onRefresh: () async {
                          postsFuture = PostsService().getAllPosts();
                          postsController.resetPageNumber();
                        },
                        child: Column(
                          children: [

                            Expanded(
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
                                                  postsFuture =
                                                      PostsService()
                                                          .getAllPosts();
                                                },
                                                errorMessage: "something_went_wrong"
                                                    .tr,
                                              ));
                                        } else {
                                          // return const TransactionListLoading();
                                          return const Center(child: CircularProgressIndicator());
                                        }

                                    }
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          );
        })
    );
  }
}
