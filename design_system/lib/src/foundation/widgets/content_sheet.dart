import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ApodContentSheet extends StatelessWidget {
  const ApodContentSheet({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
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
              top: mediaQuery.padding.top + theme.spacings.semiSmall,
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
                    left: theme.spacings.large,
                    right: theme.spacings.large,
                    top: theme.spacings.large,
                    bottom: mediaQuery.padding.bottom + theme.spacings.large,
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
