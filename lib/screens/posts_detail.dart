import 'package:app_test/components/posts/detail.dart';
import 'package:app_test/custom_widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';

class PostsDetailScreen extends StatelessWidget {
  const PostsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(title: "Post Detail"),
        body: const PostsDetail());
  }
}
