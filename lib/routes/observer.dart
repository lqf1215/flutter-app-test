import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

/// 定义了一个自定义的路由观察者类 HomeScreenObserver，继承自 GetObserver，并通过重写 didPop 方法实现对导航事件的监听和处理
// GetObserver 是 GetX 框架提供的一个观察者类，用于监听路由的变化（如页面跳转、弹出等）。
// 通过继承 GetObserver，可以重写一些方法来响应特定的路由事件。
class HomeScreenObserver extends GetObserver {
// didPop 是 Flutter 路由观察者类中的一个方法，在路由被弹出时调用。也就是说，当用户离开当前页面返回上一个页面时，didPop 会被触发。
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (Get.currentRoute == RouteConstants.homeRoute) {
      // final WalletController walletController = Get.find();
      // walletController.resetPageNumber();
      // walletController.updateWalletListBalance();
      //WalletService().getAllTransactions();
      print("Home Screen Route");
    }
  }
}
