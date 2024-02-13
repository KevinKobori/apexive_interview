import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageHeader extends StatelessWidget {
  const PicturesPageHeader({
    super.key,
    required this.controller,
    required this.image,
  });

  final ScrollController controller;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    return AnimatedBuilder(
      animation: controller,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(
            theme.spacings.large,
          ),
          child: Center(
            child: SvgPicture(
              theme.images.appWarmLogo,
              height: theme.typography.title1.fontSize,
              width: theme.typography.title1.fontSize! * 3,
            ),
          ),
        ),
      ),
      builder: (context, child) {
        final scrollAmount = (1 -
                (controller.offset.abs() /
                    theme.typography.title1.fontSize! *
                    0.5))
            .clamp(0, 1);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
              opacity: 0.025 + 0.375 * scrollAmount,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
