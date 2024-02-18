import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodSliverGridTile extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> children;
  final EdgeInsets? padding;

  const ApodSliverGridTile({
    required this.children,
    super.key,
    this.crossAxisCount = 2,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    final grid = SliverMasonryGrid.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: theme.spacings.semiSmall,
      crossAxisSpacing: theme.spacings.semiSmall,
      childCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );

    if (padding != null) {
      return SliverPadding(
        padding: padding!,
        sliver: grid,
      );
    } else {
      return grid;
    }
  }
}
