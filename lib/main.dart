import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sample/common/app_languages.dart';
import 'package:flutter_sample/page/home/binding.dart';
import 'package:flutter_sample/page/navigation/view.dart';
import 'package:flutter_sample/page/theme/theme_view.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';


void main() async {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  static const listWidget = ["Text Widget", "Image Widget"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView.separated(
        itemBuilder: (BuildContext context,index){
          return Text(listWidget[index],style: TextStyle(fontSize: 16,color: Colors.black),);
        },
        separatorBuilder: (BuildContext context,index){
          return Divider();
        },
        itemCount: listWidget.length,
      ),
    );
  }
}



