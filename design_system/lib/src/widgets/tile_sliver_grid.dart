import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

class AppTileSliverGrid extends StatelessWidget {
  const AppTileSliverGrid({
    required this.children,
    super.key,
    this.crossAxisCount = 2,
    this.padding,
  });

  final int crossAxisCount;
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final grid = SliverMasonryGrid.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: theme.spacing.semiSmall,
      crossAxisSpacing: theme.spacing.semiSmall,
      childCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );

    final padding = this.padding;
    if (padding != null) {
      return SliverPadding(
        padding: padding,
        sliver: grid,
      );
    }

    return grid;
  }
}
