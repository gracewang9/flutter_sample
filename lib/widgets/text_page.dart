import 'package:flutter/material.dart';
import 'package:flutter_sample/widgets/base_stateless.dart';

class TextPage extends BaseStateless {
  const TextPage({super.key, title="Text"}) : super(title: title);

  @override
  Widget body(BuildContext context) {
   return Column(children: [

      Text("data",style: TextStyle(color: (Colors.black),fontSize: 20),),
      Text("data"),
      Text("data"),
    ],);
  }
}
