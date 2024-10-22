import 'package:app_test/main.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/routes/home_binding.dart';
import 'package:app_test/screens/home.dart';
import 'package:app_test/screens/one.dart';
import 'package:app_test/screens/posts.dart';
import 'package:app_test/screens/posts_detail.dart';
import 'package:app_test/screens/two.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {

  String checkLoginStatus() {
    // if (KVService()
    //     .getStringPrefValue(key: KvConstants.walletPassword)
    //     .isEmpty) {
      return RouteConstants.initialRoute;
    // } else {
    //   return RouteConstants.loginRoute;
    // }
  }

  static List<GetPage> pages = [
    GetPage(name: RouteConstants.initialRoute,
      page: () => const HomeScreen(),
      // binding:
    ),
    GetPage(name: RouteConstants.homeRoute,
      page: () => const HomeScreen(),
      // binding:
    ),
    GetPage(name: RouteConstants.oneRoute,
      page: () => OneScreen(),
      binding: HomeBinding()  ,
    ),
    GetPage(name: RouteConstants.twoRoute,
      page: () => TwoScreen(),
      binding: HomeBinding()  ,
    ),
    GetPage(name: RouteConstants.postsRoute,
      page: () =>  const PostsScreen(),
      binding: HomeBinding()  ,
    ),
    GetPage(name: RouteConstants.postsDetailRoute,
      page: () =>  const PostsDetailScreen(),
    )
  ];
}