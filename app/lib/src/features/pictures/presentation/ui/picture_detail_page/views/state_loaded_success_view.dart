import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import '../widgets/navigation_bar.dart';

class PictureDetailPageStateLoadedSuccessView extends StatelessWidget {
  const PictureDetailPageStateLoadedSuccessView({
    super.key,
    required this.aspectRatio,
    required this.pictureDate,
    this.pictureViewModel,
  });

  final double aspectRatio;
  final String pictureDate;
  final PictureViewModel? pictureViewModel;

  @override
  Widget build(BuildContext context) {
    return PictureDetailLayout(pictureViewModel: pictureViewModel);
  }
}

/// State dependencies :
/// * [AccountOverviewBloc]
/// * [NotificationsOverviewBloc]
/// * [CollectionsOverviewBloc]
class PictureDetailLayout extends StatelessWidget {
  const PictureDetailLayout({
    super.key,
    this.pictureViewModel,
  });

  final PictureViewModel? pictureViewModel;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppScaffold(
      // TODO: NOW - TURN IT NON NULABLE??
      backgroundImage: CachedNetworkImageProvider(pictureViewModel!.url),
      body: AppContentSheet(
        children: [
          if (pictureViewModel == null) const AppText.title2('Not found'),
          if (pictureViewModel != null)
            ..._buildBody(context, theme, pictureViewModel!),
        ],
      ),
      floatingBar: PictureDetailNavigationBar(
        accountOverviewPresenter: Modular.get<AccountOverviewBloc>(),
        collectionsOverviewPresenter: Modular.get<CollectionsOverviewBloc>(),
        notificationsOverviewPresenter:
            Modular.get<NotificationsOverviewBloc>(),
      ),
    );
  }

  List<Widget> _buildBody(
      BuildContext context, AppThemeData theme, PictureViewModel picture) {
    return [
      ClipRRect(
        borderRadius: theme.radius.asBorderRadius().regular,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              picture.url,
            ),
          ),
        ),
      ),
      AppText.title1(picture.title),
      AppText.title3(
        picture.date,
        color: theme.colors.accent,
      ),
      AppText.paragraph1(picture.explanation),
      const SizedBox(
        height: 100,
      ),
    ];
  }
}
