import 'package:app_test/routes/app_pages.dart';
import 'package:app_test/routes/observer.dart';
import 'package:app_test/services/permission.dart';
import 'package:app_test/utils/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

void main() async{
  //  是用于与 Flutter 引擎进行交互的绑定，提供了许多重要的功能，例如调度、事件分发、渲染等。调用 ensureInitialized() 可以确保在使用 Flutter 框架的功能之前，框架已经完全初始化。
  // WidgetsFlutterBinding.ensureInitialized();
// 用于初始化存储系统，确保存储文件被正确加载。它是一个异步操作，因此你需要使用 await 来等待其完成，确保在后续使用 GetStorage 存取数据之前已经完成初始化。
// 加载存储文件：当你调用 GetStorage.init() 时，GetStorage 会在设备上创建或加载一个存储文件（通常是 .getStorage 文件），该文件用于持久化数据。
  await GetStorage.init();
  // 设置应用程序的首选屏幕方向的异步方法。
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp, //  屏幕竖直向上
    DeviceOrientation.portraitDown, // 屏幕竖直向下（倒置）
  ]);
  await PermissionService().getPermissions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Demo',
      debugShowCheckedModeBanner: false, // 隐藏调试模式下右上角显示的 "Debug" 横幅
      // theme: CustomTheme.lightTheme, // 定义应用的亮色主题，即应用在正常光照环境下显示的主题样式。
      // darkTheme: CustomTheme.darkTheme, // 定义应用的暗色主题，即当系统进入暗色模式时显示的主题。
      themeMode: ThemeMode.system, // 应用会根据设备系统的设置自动在亮色和暗色主题之间切换 light：总是使用亮色主题。 dark：总是使用暗色主题。
      builder: EasyLoading.init(), // 是用于对整个应用的构建函数进行修改或包装 来自 flutter_easyloading 包，它用于初始化全局加载框架，方便显示加载动画
      localizationsDelegates: const [// 国际化设置
        GlobalMaterialLocalizations.delegate, // 提供 Material 风格组件的本地化支持。
        GlobalWidgetsLocalizations.delegate, // 支持 Flutter 小部件的本地化。
        GlobalCupertinoLocalizations.delegate, // 提供 Cupertino 风格组件的本地化支持。
        DefaultCupertinoLocalizations.delegate,
      ],
      fallbackLocale: const Locale('en', 'US'), // 当应用找不到设备支持的语言时，将使用 fallbackLocale 指定的语言作为回退语言
      translations: AppTranslation(), // 翻译文件
      supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')], // 定义了应用支持的语言
      locale: Get.deviceLocale, // 用于自动检测设备的当前语言并设置应用的显示语言。
      initialRoute: AppPages().checkLoginStatus(), // 是应用启动时的初始路由（页面）。在这里通过 AppPages().checkLoginStatus() 检查登录状态来决定启动哪个页面。
      getPages: AppPages.pages, //  GetX 路由管理的功能。它定义了应用中的所有页面和路由，通过 AppPages.pages 来配置路由信息。
      navigatorObservers: [HomeScreenObserver()], // 是用于监听应用导航事件的观察者，这里通过自定义的 HomeScreenObserver 监视导航操作，通常用于实现自定义的导航逻辑或者分析用户的页面浏览行为。
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}