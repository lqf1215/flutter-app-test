
import 'package:app_test/controllers/color.dart';
import 'package:app_test/controllers/local_data.dart';
import 'package:app_test/controllers/posts.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(LocalDataController(),permanent: true);
    Get.put(ColorController(), permanent: true);
    Get.put(PostsController(), permanent: true);
  }
}