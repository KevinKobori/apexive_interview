import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';
import 'package:nasa_apod_design_system/src/widgets/base/padding.dart';

class ApodContainer extends StatelessWidget {
  const ApodContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.constraints,
    this.transform,
    this.transformAlignment,
    this.child,
  });

  final ApodEdgeInsets? padding;
  final ApodEdgeInsets? margin;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Clip clipBehavior;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return Container(
      width: width,
      height: height,
      padding: padding?.toEdgeInsets(theme),
      margin: margin?.toEdgeInsets(theme),
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
