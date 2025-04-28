import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_logic.dart';
import 'settings_state.dart';

class SettingsPage extends GetView<SettingsLogic> {
  SettingsPage({super.key});

  // final SettingsLogic logic = Get.put(SettingsLogic());
  final SettingsState state = Get.find<SettingsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(children: [Icon(Icons.share), Text("个人收藏列表")]),
          SizedBox(height: 20.0),
          Row(children: [Icon(Icons.access_time_filled), Text("个人收藏列表")]),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
