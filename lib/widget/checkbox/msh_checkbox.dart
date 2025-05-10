import 'package:flutter/material.dart';
import 'checkboxes/msh_checkbox_base.dart';
import 'msh_checkbox_state.dart';
import 'msh_checkbox_style.dart';
import 'msh_color_config.dart';

// Color(0xFFCCCCCC)
class MSHCheckbox extends StatefulWidget {
  /// Creates an MSHCheckbox.
  const MSHCheckbox({
    super.key,
    required this.value,
    this.isDisabled = false,
    // MSHColorConfig? colorConfig,
    this.size = 18,
    this.duration,
    this.style = MSHCheckboxStyle.stroke,
    required this.onChanged,
    required this.colorConfig,
  });

  // : colorConfig = colorConfig ??
  //       MSHColorConfig.fromCheckedUncheckedDisabled(
  //         checkedColor: checkedColor,
  //         uncheckedColor: uncheckedColor,
  //         disabledColor: disabledColor,
  //       ),

  /// Whether this checkbox is checked.
  final bool value;

  /// Whether the checkbox is disabled.
  final bool isDisabled;

  // /// The color of the checkbox when [value] is `true`. If [colorConfig] is
  // /// specified, this value will be overridden by [MSHColorConfig.onFillColor].
  // @Deprecated("Use MSHColorConfig.fromCheckedUncheckedDisabled instead.")
  // final Color? checkedColor;
  //
  // /// The color of the checkbox when [value] is `false`. If [colorConfig] is
  // /// specified, this value will be overridden by [MSHColorConfig.offTintColor].
  // @Deprecated("Use MSHColorConfig.fromCheckedUncheckedDisabled instead.")
  // final Color uncheckedColor;
  //
  // /// The color of the checkbox when [isDisabled] is `true`. If [colorConfig] is
  // /// specified, this value will be overridden by [MSHColorConfig.disabledTintColor],
  // /// or [MSHColorConfig.disabledFillColor], depending on the style.
  // @Deprecated("Use MSHColorConfig.fromCheckedUncheckedDisabled instead.")
  // final Color disabledColor;

  /// The color configuration of the checkbox.
  final MSHColorConfig colorConfig;

  /// The height and width of the checkbox.
  final double size;

  /// The duration of the animation which plays when [value] changes.
  final Duration? duration;

  /// The style of the animation and the check.
  final MSHCheckboxStyle style;

  /// Called when the value of the checkbox should change.
  final void Function(bool selected) onChanged;

  @override
  State<MSHCheckbox> createState() => _MSHCheckboxState();
}

class _MSHCheckboxState extends State<MSHCheckbox>
    with SingleTickerProviderStateMixin {
  double get _strokeWidth => 3.5 * (widget.size / 60);

  late final animationController = AnimationController(
    vsync: this,
    duration: duration,
  );

  Duration get duration {
    if (widget.duration != null) {
      return widget.duration!;
    }

    switch (widget.style) {
      case MSHCheckboxStyle.stroke:
        return const Duration(milliseconds: 700);
      case MSHCheckboxStyle.fillScaleColor:
        return const Duration(milliseconds: 400);
      // case MSHCheckboxStyle.fillScaleCheck:
      //   return const Duration(milliseconds: 500);
      case MSHCheckboxStyle.fillFade:
        return const Duration(milliseconds: 300);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.value) {
      animationController.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant MSHCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    animationController.duration = duration;

    if (widget.value != oldWidget.value) {
      if (widget.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = MSHCheckboxState(
      context: context,
      isDisabled: widget.isDisabled,
      style: widget.style,
    );

    return GestureDetector(
      onTap: () {
        if (!widget.isDisabled) {
          widget.onChanged(!widget.value);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: widget.size + _strokeWidth,
            width: widget.size + _strokeWidth,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.colorConfig.borderColor(state),
                  width: _strokeWidth,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: widget.size,
              minWidth: widget.size,
            ),
            child: MSHCheckboxBase(
              context: context,
              style: widget.style,
              isDisabled: widget.isDisabled,
              colorConfig: widget.colorConfig,
              animation: animationController,
              strokeWidth: _strokeWidth,
              size: widget.size,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
