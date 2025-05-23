import 'package:flutter/material.dart';

import 'msh_checkbox_state.dart';
import 'msh_checkbox_style.dart';


/// A callback function which returns a [Color] based on a given [MSHCheckboxState]
typedef ColorFromState = Color Function(MSHCheckboxState);

/// A color configuration for [MSHCheckbox]. This class gives a more fine-grained
/// level of control over the coloring of the checkbox, by allowing colors to be specified
/// for each component of the checkbox.
class MSHColorConfig {
  /// The color of the border of the checkbox when [MSHCheckbox.value] is `false`.
  final ColorFromState borderColor;

  /// The color of the border of the checkbox when [MSHCheckbox.value] is `true`.
  final ColorFromState tintColor;

  /// The background fill color for the checkbox when [MSHCheckbox.value] is `true`.
  final ColorFromState fillColor;

  /// The color of the check mark.
  final ColorFromState checkColor;

  /// Construct an MSHColorConfig
  const MSHColorConfig({
    ColorFromState? borderColor,
    ColorFromState? tintColor,
    ColorFromState? fillColor,
    ColorFromState? checkColor,
  })  : borderColor = borderColor ?? _defaultBorderColor,
        tintColor = tintColor ?? _defaultTintColor,
        fillColor = fillColor ?? _defaultFillColor,
        checkColor = checkColor ?? _defaultCheckColor;

  /// Presents a simplified interface for constructing an [MSHColorConfig].
  factory MSHColorConfig.fromCheckedUncheckedDisabled({
    /// The color of the check and border or fill when [MSHCheckbox.value] is `true`.
    Color? checkedColor,

    /// The color of the checkbox when [MSHCheckbox.value] is `false`.
    Color uncheckedColor = const Color(0xFFCCCCCC),

    /// The color of the checkbox when [MSHCheckbox.isDisabled] is `true`.
    Color disabledColor = const Color(0xFFCCCCCC),
  }) =>
      MSHColorConfig(
        borderColor: (state) =>
            state.isDisabled ? disabledColor : uncheckedColor,
        tintColor: (state) => state.isDisabled
            ? disabledColor
            : (checkedColor ?? _defaultToggleableColor(state)),
        fillColor: (state) => state.isDisabled
            ? disabledColor
            : (checkedColor ?? _defaultToggleableColor(state)),
        checkColor: (state) {
          if (state.style == MSHCheckboxStyle.stroke) {
            return state.isDisabled
                ? disabledColor
                : (checkedColor ?? _defaultToggleableColor(state));
          } else {
            return Colors.white;
          }
        },
      );

  static Color _defaultBorderColor(MSHCheckboxState state) {
    return const Color(0xFFCCCCCC);
  }

  static Color _defaultTintColor(MSHCheckboxState state) {
    return _defaultToggleableColor(state);
  }

  static Color _defaultFillColor(MSHCheckboxState state) {
    return _defaultToggleableColor(state);
  }

  static Color _defaultCheckColor(MSHCheckboxState state) {
    if (state.style == MSHCheckboxStyle.stroke) {
      return _defaultToggleableColor(state);
    } else {
      return Colors.white;
    }
  }

  static Color _defaultToggleableColor(MSHCheckboxState state) {
    return Theme.of(state.context)
            .checkboxTheme
            .fillColor
            ?.resolve({MaterialState.selected}) ??
        Theme.of(state.context).colorScheme.secondary;
  }
}
