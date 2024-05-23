import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final apodElevatedButtonStyle = Style(
  height(100),
  width(100),
  margin(10, 20),
  backgroundColor.blue(),
  borderRadius(10),
  border(
    color: Colors.black,
    width: 1,
    style: BorderStyle.solid,
  ),
);

class ApodElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const ApodElevatedButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: apodElevatedButtonStyle,
      onPress: onPressed,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
