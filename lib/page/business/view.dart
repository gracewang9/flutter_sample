import 'package:flutter/material.dart';
import 'package:flutter_sample/widget/animations/animated_build.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BusinessPage extends StatelessWidget {
  BusinessPage({super.key});

  final BusinessLogic logic = Get.put(BusinessLogic());
  final BusinessState state = Get.find<BusinessLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(child: RotationAnimated(),);
  }
}
