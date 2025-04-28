import 'package:flutter/material.dart';
import 'package:flutter_sample/common/app_languages.dart';
import 'package:flutter_sample/l10n/app_localizations.dart';
import 'package:flutter_sample/page/home/home_binding.dart';
import 'package:flutter_sample/page/home/home_controller.dart';
import 'package:flutter_sample/page/home/home_widget.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    GetMaterialApp(
      initialBinding: HomeBinding(),
      // initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages.toList(),
      // translations: Messages(),
      // locale: Locale('zh', 'CN'),
      // fallbackLocale: Locale('en', 'US'),
      // getPages: [
      //   GetPage(name: '/', page: () => Home())
      // ],
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  // void getData() async {
  //   HomeProvider provider = HomeProvider();
  //   var page = 0;
  //   provider.getArticleList(page);
  // }

  @override
  Widget build(BuildContext context) {
    ///使用get.put实例化你的类
    // Controller controller = Get.put(Controller());

    return Scaffold(
      ///Text套上Obx(()=>Text("${controller.count}"))表示当controller.count的值变化时会更新页面
      appBar: AppBar(
        title: Text("Flutter Demo"),
        leading: TextButton(
          child: Text("登录"),
          onPressed: () {
            Get.toNamed(AppRoutes.login);
          },
        ),
        flexibleSpace: IconButton(icon: Icon(Icons.add), onPressed: () {}),
      ),
      body: HomeWidget(),

      // Center(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         ///Get.to()跳转到下一个页面，（代替Navigator.push那8行）
      //         onPressed: () => Get.to(SampleApp()),
      //         child: Text("Go to SampleApp"),
      //       ),
      //       Padding(padding: EdgeInsets.only(top: 20.0)),
      //       ElevatedButton(
      //         onPressed:
      //             () => Get.changeTheme(
      //               ThemeData.dark(),
      //               // Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
      //             ),
      //         child: Text("切换主题".tr),
      //       ),
      //
      //       ElevatedButton(
      //         onPressed:
      //             () => Get.defaultDialog(
      //               onConfirm: () {
      //                 print("OK");
      //                 Get.back();
      //               },
      //               onCancel: () {
      //                 print("Cancel");
      //                 Get.back();
      //               },
      //               middleText: "Dialog made in 3 lines of code",
      //             ),
      //         child: Text("Open get default dialog"),
      //       ),
      //
      //       ElevatedButton(
      //         onPressed:
      //             () => Get.bottomSheet(
      //               Container(
      //                 decoration: BoxDecoration(color: Colors.grey),
      //                 child: Wrap(
      //                   children: [
      //                     ListTile(
      //                       leading: Icon(Icons.music_note),
      //                       title: Text("Music"),
      //                       onTap: () {},
      //                     ),
      //                     Divider(color: Colors.black,),
      //                     ListTile(
      //                       leading: Icon(Icons.videocam),
      //                       title: Text('Video'),
      //                       onTap: () {},
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //         child: Text("Open bottom sheet"),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.increment,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class Controller extends GetxController {
  ///0.obs表示count字段被观察
  var count = 0.obs;

  ///自增函数
  increment() => count++;
}

class SampleApp extends StatelessWidget {
  SampleApp({super.key});

  ///Get.find()查找一个正在被其他页面使用的Controller，并将它返回给你
  final Controller controller = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title:
            AppLocalizations.of(context)?.title ??
            "My is GetX go to ${controller.count}",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FlutterNativeSplash.remove();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 80.0,
        itemBuilder: (BuildContext context, index) {
          return _ListItemWidget(index: index);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@immutable
class _ListItemWidget extends StatefulWidget {
  _ListItemWidget({required this.index});

  int index;

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<_ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("images/androidIcon.png", width: 40.0, height: 40.0),
              Padding(padding: EdgeInsets.only(left: 5.0)),
              Column(
                children: [
                  Text(
                    "data${widget.index}",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  Text(
                    "data${widget.index}",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10.0,
                height: 10.0,
                child: Icon(Icons.share, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
