import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// StatefulWidget 是用于表示有状态的组件，意味着该组件在生命周期内可以发生状态的变化，且当状态改变时需要重新渲染 UI。
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// _HomeScreenState 是 HomeScreen 的状态类，用于管理组件的状态和界面更新。
// with WidgetsBindingObserver 用来监听应用的生命周期变化，可以在应用状态（比如前台、后台切换）时执行特定逻辑。
// SingleTickerProviderStateMixin 用于在该状态类中创建和管理动画，特别是单个动画控制器。
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Color(0xFF000000),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'FangZhengHeiTiFanTi'),
        ),
        actions: [],
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Padding(
            padding: EdgeInsets.only(),
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20, top: 60, bottom: 20),
            child: const Text(
              "Home",
            ),
          ),


          Container(
            //color: Colors.red,
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 40),
            child: Center(
              child: SizedBox(
                height: 44,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.oneRoute);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff0563B6))),

                  child: const Text(
                    "Next To One",
                    style: CommonStyle.text_16_white_w500,
                  ),
                ),
              ),
            ),
          ),

          Container(
            //color: Colors.red,
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 40),
            child: Center(
              child: SizedBox(
                height: 44,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(RouteConstants.postsRoute);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff0563B6))),

                  child: const Text(
                    "Next To Posts List",
                    style: CommonStyle.text_16_white_w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
