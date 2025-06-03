import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/widgets/base_stateless.dart';

class ImagePage extends BaseStateless {
  ImagePage({title = "Image"}) : super(title: title);

  @override
  Widget body(BuildContext context) {
    return Column(children: [
      Image.asset("images/androidIcon.png"),


    ],);
  }
}
