import 'package:flutter/material.dart';
import 'package:flutter_sample/widget/checkbox/checkboxes/stroke_checkbox.dart';
import 'package:flutter_sample/widget/checkbox/msh_checkbox_state.dart';

import '../msh_checkbox_style.dart';
import '../msh_color_config.dart';
import 'fill_fade_checkbox.dart';
import 'fill_scale_color_checkbox.dart';

class MSHCheckboxBase extends StatelessWidget {
  final Animation<double> animation;
  final BuildContext context;
  final MSHCheckboxStyle style;
  final MSHColorConfig colorConfig;
  final bool isDisabled;
  final double size;
  final double strokeWidth;

  MSHCheckboxState get state =>
      MSHCheckboxState(context: context, isDisabled: isDisabled, style: style);

  const MSHCheckboxBase({
    super.key,
    required this.animation,
    required this.colorConfig,
    required this.context,
    required this.isDisabled,
    required this.size,
    required this.strokeWidth,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case MSHCheckboxStyle.stroke:
        return StrokeCheckbox(parent: this);
      case MSHCheckboxStyle.fillScaleColor:
        return FillScaleColorCheckbox(parent: this);
      // case MSHCheckboxStyle.fillScaleCheck:
      //   return FillScaleCheckCheckbox(parent: this);
      case MSHCheckboxStyle.fillFade:
        return FillFadeCheckbox(parent: this);
    }
  }

  Color fillColor() => colorConfig.fillColor(state);

  Color checkColor() => colorConfig.checkColor(state);

  Color tintColor() => colorConfig.tintColor(state);
}
