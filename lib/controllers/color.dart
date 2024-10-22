
import 'package:get/get.dart';

class ColorController extends GetxController{
  int screenColor =0xFFB71C1C;

  void setColor(int color){
    screenColor = color;
    update();
  }
}