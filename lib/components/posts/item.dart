import 'package:app_test/utils/common_style.dart';
import 'package:flutter/material.dart';

class PostsItem extends StatelessWidget {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostsItem({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                color: const Color(0x05151B1A),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Id:",
                          style: CommonStyle.text_16_black_w500,
                          children: <TextSpan>[
                            TextSpan(
                              text: "$id",
                              style: CommonStyle.text_14_black_w500,
                            ),
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "userId:",
                          style: CommonStyle.text_16_black_w500,
                          children: <TextSpan>[
                            TextSpan(
                              text: "$userId",
                              style: CommonStyle.text_14_black_w500,
                            ),
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                RichText(
                  text: TextSpan(
                      text: "title:",
                      style: CommonStyle.text_16_black_w500,
                      children: <TextSpan>[
                        TextSpan(
                          text: "$title",
                          style: CommonStyle.text_14_black_w500,
                        ),
                      ]),
                ),
                const SizedBox(height: 5,),
                RichText(
                  text: TextSpan(
                      text: "body:",
                      style: CommonStyle.text_16_black_w500,
                      children: <TextSpan>[
                        TextSpan(
                          text: "$body",
                          style: CommonStyle.text_14_black_w500,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
