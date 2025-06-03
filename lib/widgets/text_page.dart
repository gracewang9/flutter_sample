import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Text"),),body: Column(children: [

      Text("data"),
      Text("data"),
      Text("data"),
    ],),);
  }
}
