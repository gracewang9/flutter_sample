import 'package:flutter/material.dart';
import 'package:flutter_sample/widgets/image_page.dart';
import 'package:flutter_sample/widgets/text_page.dart';

void main() async {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  static const listWidget = ["Text Widget", "Image Widget"];
  static const navigators = ["/textPage","/imagePage"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget List",
      routes: {
        "/textPage": (context) => TextPage(),
        "/imagePage": (context) => ImagePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget List"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return Container(
              height: 50,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, navigators[index]);
                },
                child: Text(
                  listWidget[index],
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return Divider();
          },
          itemCount: listWidget.length,
        ),
      ),
    );
  }
}
