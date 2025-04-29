import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static const String sName = "login";

  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ///触摸收起键盘
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text("login".tr)),
        body: Container(color: Theme.of(context).primaryColor,child: Stack(children: [
          // Image.asset(),

        ],),),
        // body: Consumer(builder: (BuildContext context,Widget value, Widget? child) {
        //   return Container(color: Theme.of(context).primaryColor,
        //   child: Stack(children: [
        //     Positioned.fill(child: AnimatedBa)
        //   ],),
        //   );
        // }),
        // body: StreamConsumer(),
      ),
    );
  }
}
