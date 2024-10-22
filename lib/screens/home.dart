import 'package:app_test/routes/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/appbar/app_bar.dart';
import '../custom_widgets/button/custom_elevated_button.dart';

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
  List<String> screens = ["container", "posts"];

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: "Home"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConstants.oneRoute);
              },
              buttonText: "Next to one",
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(RouteConstants.postsRoute);
              },
              buttonText: "Next To Posts List",
            ),
          ],
        ),
      ),
    );
  }
}
