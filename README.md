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


[flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

# 添加启动页 flutter pub get

在flutter_native_splash.yaml文件修改后，需要到终端运行以下命令：
dart run flutter_native_splash:create

[添加国际化](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)
# 在Terminal窗口输入以下命令：
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any

# 示例：
dependencies:
    flutter:
      sdk: flutter
    flutter_localizations:
      sdk: flutter
    intl: any
# 在main.dart文件中使用：
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

# 在pubspec.yaml文件中添加：
flutter:
   generate: true # Add this line
# 在项目的根目录创建一个文件命名为l10n.yaml，内容如下：
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
# 在lib文件夹中创建l10n文件夹，再创建个文件命名为app_en.arb，内容如下：
{
"helloWorld": "Hello World!",
"@helloWorld": {
"description": "The conventional newborn programmer greeting"
}
}
# 在lib文件夹中创建l10n文件夹，再创建其他语言的文件命名为app_zh.arb，内容如下：
{
"helloWorld": "你好，世界!",
}
# 执行flutter pub get命名 或 flutter run
# 使用
AppLocalizations.of(context)!.helloWorld