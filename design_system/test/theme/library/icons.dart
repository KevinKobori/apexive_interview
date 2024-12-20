part of 'library.dart';

ThemeSection icons(BuildContext context) {
  final assets = Theme.of(context).extension<XAssetsData>()!;
  final colorScheme = Theme.of(context).colorScheme;

  return ThemeSection(
    title: 'Icons',
    categories: [
      ThemeCategory(
        title: 'Small',
        children: [
          ...assets.icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: c as Named<String>,
              builder: (context, v, _) => ApodIcon(
                v,
                color: colorScheme.onSurface,
                size: ApodIconSize.extraSmall,
              ),
            ),
          ),
        ],
      ),
      ThemeCategory(
        title: 'Large',
        children: [
          ...assets.icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: c as Named<String>,
              builder: (context, v, _) => ApodIcon(
                v,
                color: colorScheme.onSurface,
                size: ApodIconSize.medium,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
