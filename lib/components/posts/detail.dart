import 'package:app_test/models/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsDetail extends StatelessWidget {
  final PostsModel posts;

  const PostsDetail({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),child: Column(children: [
    Text("Id:${posts.id}"),
    Text("Title:${posts.title}"),
    Text("Body:${posts.body}"),
    ]));
  }
}
