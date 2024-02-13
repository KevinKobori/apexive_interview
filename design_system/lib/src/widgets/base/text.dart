import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

enum ApodTextLevel {
  paragraph1,
  paragraph2,
  title1,
  title2,
  title3,
}

class ApodText extends StatelessWidget {
  const ApodText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.level = ApodTextLevel.paragraph1,
  });

  const ApodText.paragraph1(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
  }) : level = ApodTextLevel.paragraph1;

  const ApodText.paragraph2(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
  }) : level = ApodTextLevel.paragraph2;

  const ApodText.title1(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
  }) : level = ApodTextLevel.title1;

  const ApodText.title2(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
  }) : level = ApodTextLevel.title2;

  const ApodText.title3(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
  }) : level = ApodTextLevel.title3;

  final String data;
  final ApodTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    final style = () {
      switch (level) {
        case ApodTextLevel.paragraph1:
          return theme.typography.paragraph1;
        case ApodTextLevel.paragraph2:
          return theme.typography.paragraph2;
        case ApodTextLevel.title1:
          return theme.typography.title1;
        case ApodTextLevel.title2:
          return theme.typography.title2;
        case ApodTextLevel.title3:
          return theme.typography.title3;
      }
    }();
    return Text(
      data,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
    );
  }
}
