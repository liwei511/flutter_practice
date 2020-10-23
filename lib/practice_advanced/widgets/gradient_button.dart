import 'package:flutter/material.dart';

enum DecorateType { linear, radial, sweep }

class GradientButton extends StatelessWidget {
  GradientButton(
      {Key key,
      this.colors,
      this.width,
      this.height,
      this.borderRadius,
      this.onPressed,
      this.decorateType,
      @required this.child})
      : super(key: key);

  // 渐变色数组
  final List<Color> colors;
  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  // 支持圆角
  final BorderRadius borderRadius;

  // 渐变类型
  final DecorateType decorateType;

  // 点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // 如果colors没传
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: decorateType == DecorateType.radial
              ? RadialGradient(colors: _colors)
              : LinearGradient(colors: _colors),
          borderRadius: borderRadius,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: _colors.last,
            highlightColor: Colors.transparent,
            borderRadius: borderRadius,
            onTap: onPressed,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tightFor(height: height, width: width),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    child: child,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
