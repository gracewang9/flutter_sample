import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.child,
    this.colors,
    this.textColor,
    this.splashColor,
    this.disabledTextColor,
    this.disabledColor,
    this.padding,
    this.borderRadius,
    this.onPressed,
    this.onHighlightChanged,
  });

  // 渐变色数组
  final List<Color>? colors;
  final Color? textColor;
  final Color? splashColor;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final EdgeInsetsGeometry? padding;

  final Widget child;
  final BorderRadius? borderRadius;

  final GestureTapCallback? onPressed;
  final ValueChanged<bool>? onHighlightChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final radius = borderRadius;
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    bool disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: disabled ? null : LinearGradient(colors: _colors),
        color: disabled ? disabledColor ?? theme.disabledColor : null,
        borderRadius: radius,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: radius,
        clipBehavior: Clip.hardEdge,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 88, minHeight: 36),
          child: InkWell(
            splashColor: splashColor ?? _colors.last,
            highlightColor: Colors.transparent,
            onHighlightChanged: onHighlightChanged,
            onTap: onPressed,
            child: Padding(
              padding: padding ?? theme.buttonTheme.padding,
              child: DefaultTextStyle(
                style: TextStyle(fontWeight: FontWeight.bold),
                child: Center(
                  child: DefaultTextStyle(
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: disabled
                          ? disabledTextColor ?? Colors.black38
                          : textColor ?? Colors.white,
                    ),
                    child: child,
                  ),
                  widthFactor: 1,
                  heightFactor: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedGradientButton extends StatefulWidget {
  const ElevatedGradientButton({
    super.key,
    required this.child,
    this.colors,
    this.textColor,
    this.splashColor,
    this.disabledColor,
    this.disabledTextColor,
    this.shadowColor,
    this.padding,
    this.borderRadius,
    this.onPressed,
    this.onHighlightChanged,
  });

  // 渐变色数组
  final List<Color>? colors;
  final Color? textColor;
  final Color? splashColor;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;

  final Widget child;
  final BorderRadius? borderRadius;

  final GestureTapCallback? onPressed;
  final ValueChanged<bool>? onHighlightChanged;

  @override
  _ElevatedGradientButtonState createState() => _ElevatedGradientButtonState();
}

class _ElevatedGradientButtonState extends State<ElevatedGradientButton> {
  bool _tapDown = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onPressed == null;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        boxShadow:
            disabled
                ? null
                : [
                  _tapDown
                      ? BoxShadow(
                        offset: Offset(2, 6),
                        spreadRadius: -2,
                        blurRadius: 9,
                      )
                      : BoxShadow(
                        offset: Offset(0, 2),
                        spreadRadius: -2,
                        blurRadius: 3,
                        color: widget.shadowColor ?? Colors.black87,
                      ),
                ],
      ),
      child: ElevatedGradientButton(
        colors: widget.colors,
        onPressed: widget.onPressed,
        padding: widget.padding,
        borderRadius: widget.borderRadius,
        textColor: widget.textColor,
        splashColor: widget.splashColor,
        disabledColor: widget.disabledColor,
        disabledTextColor: widget.disabledTextColor,
        onHighlightChanged: (v) {
          setState(() {
            _tapDown = v;
          });
          if (widget.onHighlightChanged != null) {
            widget.onHighlightChanged!(v);
          }
        },
        child: widget.child,
      ),
    );
  }
}
