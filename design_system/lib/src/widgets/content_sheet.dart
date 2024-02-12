import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AppContentSheet extends StatelessWidget {
  const AppContentSheet({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final route = ModalRoute.of(context);
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: route!.animation!,
          curve: Curves.easeOutQuad,
        ),
      ),
      child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: mediaQuery.padding.top + theme.spacing.semiSmall,
            ),
            sliver: SliverStack(
              children: <Widget>[
                SliverPositioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: theme.radius.asBorderRadius().superLarge,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: theme.spacing.large,
                    right: theme.spacing.large,
                    top: theme.spacing.large,
                    bottom: mediaQuery.padding.bottom + theme.spacing.large,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...children.reversed,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
