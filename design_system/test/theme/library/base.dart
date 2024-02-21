import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({
    required this.title,
    required this.sections,
    super.key,
  });
  final String title;
  final List<ThemeSection> sections;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: ApodPadding(
        padding: const ApodEdgeInsets.extraLarge(),
        child: SpacedColumn(
          spaceBetween: metrics.spacings.large,
          children: [
            ApodText.titleLarge(title),
            ...sections,
          ],
        ),
      ),
    );
  }
}

class ThemeSection extends StatelessWidget {
  const ThemeSection({
    required this.title,
    required this.categories,
    super.key,
  });

  final String title;
  final List<ThemeCategory> categories;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SpacedColumn(
      spaceBetween: 20.0,
      children: [
        ApodText.custom(
          title,
          style: textTheme.titleMedium!.copyWith(
            color: colors.primary,
          ),
        ),
        ...categories,
      ],
    );
  }
}

class ThemeCategory extends StatelessWidget {
  const ThemeCategory({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ApodText.titleSmall(title),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: children,
        ),
      ],
    );
  }
}

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({
    required this.spaceBetween,
    required this.children,
    super.key,
  });

  final double spaceBetween;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (children.isNotEmpty) children.first,
        ...children
            .skip(1)
            .map((e) => <Widget>[
                  SizedBox(height: spaceBetween),
                  e,
                ])
            .expand((e) => e),
      ],
    );
  }
}

class NamedCell<T> extends StatelessWidget {
  const NamedCell({
    required this.value,
    required this.builder,
    super.key,
  });

  final Named<T> value;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ApodThemeData>()!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: metrics.spacings.xInsets.semiSmall,
          decoration: BoxDecoration(
            border: Border.all(
              color: colors.onBackground.withAlpha(125),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: builder(context, value.value, null),
        ),
        ApodText.custom(
          value.name,
          style: textTheme.bodyMedium!.copyWith(
            color: colors.onBackground.withAlpha(125),
            fontSize: metrics.spacings.small,
          ),
        ),
      ],
    );
  }
}
