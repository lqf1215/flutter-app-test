import 'package:app_test/utils/color_constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/cupertino.dart';

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
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0x05151B1A),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                child: Column(
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
              )
            ],
          ),
        ));
  }
}
