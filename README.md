# flutter_sample

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 添加启动页 flutter pub get

[flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

- 在flutter_native_splash.yaml文件修改后，需要到终端运行以下命令：
- dart run flutter_native_splash:create

## 添加国际化

[internationalization](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)

- 在Terminal窗口输入以下命令：

- flutter pub add flutter_localizations --sdk=flutter
- flutter pub add intl:any

- 示例：
  dependencies:
  flutter:
  sdk: flutter
  flutter_localizations:
  sdk: flutter
  intl: any

- 在main.dart文件中使用：
  return const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
  Locale('en'), // English
  Locale('es'), // Spanish
  ],
  home: MyHomePage(),
  );

- 在pubspec.yaml文件中添加：
  flutter:
  generate: true # Add this line

- 在项目的根目录创建一个文件命名为l10n.yaml，内容如下：
  arb-dir: lib/l10n
  template-arb-file: app_en.arb
  output-localization-file: app_localizations.dart

- 在lib文件夹中创建l10n文件夹，再创建个文件命名为app_en.arb，内容如下：
  {
  "helloWorld": "Hello World!",
  "@helloWorld": {
  "description": "The conventional newborn programmer greeting"
  }
  }

- 在lib文件夹中创建l10n文件夹，再创建其他语言的文件命名为app_zh.arb，内容如下：
  {
  "helloWorld": "你好，世界!",
  }

- 执行flutter pub get命名 或 flutter run
- 使用
- AppLocalizations.of(context)!.helloWorld

## 添加 GetX

- [https://pub.dev/packages/get](https://pub.dev/packages/get)

### 一、路由管理：

- 导航到新页面 Get.to(NextScreen());
- 用别名导航到新页面 Get.toNamed("/details"); 当需要传参数时使用arguments
  字段，在需要获取的页面中使用Get.arguments获取;如果是Map Get.arguments['htmlUrl'],不需要使用构造函数传值。
- 关闭页面 Get.back();
- 进入下一个页面，但没有返回上一个页面的选项 Get.off(NextScreen());
- 进入下一个页面并取消之前的所有路由 Get.offAll(NextScreen());
- 导航到下一条路由，并在返回后立即接收或更新数据 var data=await Get.to(Payment);
- 在另一个页面上，发送前一个路由的数据 Get.back(result:'success');
- 跳转重复页面 ：Get.toNamed('xxx', preventDuplicates: false); or Get.to('xxx',preventDuplicates:
  false);

### 二、状态管理：

- 响应式变量声明
- 1、使用Rx{xx} :
  final name = RxString('');
  final map=RxMap<String,String>({});final
  list=RxList<String>([]);
- 2、使用Rx,规定的泛型 Rx<Type>：
  final name=Rx<String>(');
  final list=Rx<List<String>>([]);
  final map=Rx<Map<String,String>>({});
- 3、只需添加.obs 作为value的属性；
  final name='hello'.obs;
  final list=<String>[].obs;
  final map=<String,String>{}.obs;
- 自定义：final user=User().obs;

  注意：如果用.obs监听状态那么在View中使用Obx(()=>Widget)获取，update()
  更新在View中使用GetBuilder<Logic>(builder:(logic)=>Widget);
    - Obx是配合Rx响应式变量使用、GetBuilder是配合update使用：请注意，这完全是俩套定点刷新控件的方案
      区别：前者响应式变量变化，Obx自动刷新；后者需要使用update手动调用刷新
      GetBuilder内部实际上是对StatefulWidget的封装，所以占用资源极小

### 三、依赖管理

- Controller controller=Get.pub(Controller()); 获取实例
- Get.lazyPut<ApiMock>(() => ApiMock()); 懒加载 ，只有使用的时候被实例化
- Get.putAsync<YourAsyncClass>( () async => await YourAsyncClass() ) ; 注册一个异步实例
- 使用实例化方法/类：使用 Get.find();
- final controller = Get.find<Controller>(); or Controller controller=Get.find();
- Bindings 可以将路由、状态管理器和依赖管理器完全集成;
- 创建class HomeBinding implements Bindings {}；IDE会自动要求重写 "dependencies"方法，然后插入要在该路由上使用的所有类
  class HomeBinding implements Bindings {
  @override
  void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  Get.put<Service>(()=> Api());
  }
  }

  class DetailsBinding implements Bindings {
  @override
  void dependencies() {
  Get.lazyPut<DetailsController>(() => DetailsController());
  }
  }
- 需要通知路由，将使用该Bindings来建立路由管理器、依赖关系和状态之间的连接;
- 别名路由：
  getPages: [
  GetPage(
  name: '/',
  page: () => HomeView(),
  binding: HomeBinding(),
  ),
  GetPage(
  name: '/details',
  page: () => DetailsView(),
  binding: DetailsBinding(),
  ),
  ];
- 使用正常路由
  Get.to(Home(), binding: HomeBinding());
  Get.to(DetailsView(), binding: DetailsBinding())
    - BindingsBuilder使用：
      getPages: [
      GetPage(
      name: '/',
      page: () => HomeView(),
      binding: BindingsBuilder(() {
      Get.lazyPut<ControllerX>(() => ControllerX());
      Get.put<Service>(()=> Api());
      }),
      ),
      GetPage(
      name: '/details',
      page: () => DetailsView(),
      binding: BindingsBuilder(() {
      Get.lazyPut<DetailsController>(() => DetailsController());
      }),
      ),
      ];

## 添加webView

- [webview_flutter](https://pub.dev/packages/webview_flutter)

## 添加SharedPreferences

- [shared_preferences](https://pub.dev/packages/shared_preferences)

# 添加网络框架 Dio

[dio](https://pub.dev/packages/dio)

## 创建签名文件

- [android打包] (https://docs.flutter.cn/deployment/android)
- keytool -genkey -v -keystore $env:USERPROFILE\android-keystore.jks
  ` -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 ` -alias upload
- 打包apk包 命名：flutter build apk 或在运行 flutter build appbundle
- flutter build apk --obfuscate --split-debug-info=/out/android
  --extra-gen-snapshot-options=--save-obfuscation-map=/out/android/map.json

## vision_gallery_saver 用于将图片和视频保存到 iOS 和 Android 平台上的图库中

- [vision_gallery_saver](https://pub.dev/packages/vision_gallery_saver)