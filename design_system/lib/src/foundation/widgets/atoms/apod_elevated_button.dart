import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
// import 'package:mix/mix.dart';

// final apodElevatedButtonStyle = Style(
//   $box.height(100),
//   $box.width(100),
//   $box.margin(10, 20),
//   $box.color.blue(),
//   $box.borderRadius(10),
//   $box.border(
//     color: Colors.black,
//     width: 1,
//     style: BorderStyle.solid,
//   ),
// );

class ApodElevatedButton extends AdaptivePlatformWidget {
  final void Function()? onPressed;
  final Widget? child;

  const ApodElevatedButton.adaptive({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget get ios => CupertinoButton.filled(
        onPressed: onPressed,
        child: child ??
            const ApodBlancBox(
                logMessage: 'This can not happen. [ApodElevatedButton]'),
      );

  @override
  Widget get android => ElevatedButton(
        onPressed: onPressed,
        child: child ??
            const ApodBlancBox(
                logMessage: 'This can not happen. [ApodElevatedButton]'),
      );

  @override
  Widget get macos => ios;

  @override
  Widget get linux => android;

  @override
  Widget get windows => android;

  @override
  Widget get fuchsia => android;

  @override
  Widget get web => android;

  @override
  Widget get standard => android;
}
