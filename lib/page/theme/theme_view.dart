import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme_logic.dart';

@immutable
class ThemePage extends StatelessWidget {
  ThemePage({super.key});

  final logic = Get.put(ThemeLogic());

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = logic.themeMode;
    return SizedBox(
      child: GetBuilder<ThemeLogic>(
        builder:
            (logic) => Column(
              children: [
                RadioListTile(
                  title: Text("System"),
                  value: ThemeMode.system,
                  groupValue: themeMode,
                  onChanged: (value) {
                    themeMode = value!;
                    logic.setThemeMode(themeMode);
                  },
                ),

                RadioListTile(
                  title: Text("Light"),
                  value: ThemeMode.light,
                  groupValue: themeMode,
                  onChanged: (value) {
                    themeMode = value!;
                    logic.setThemeMode(themeMode);
                  },
                ),
                RadioListTile(
                  title: Text("Dart"),
                  value: ThemeMode.dark,
                  groupValue: themeMode,
                  onChanged: (value) {
                    themeMode = value!;
                    logic.setThemeMode(themeMode);
                  },
                ),
              ],
            ),
      ),
    );
  }
}
