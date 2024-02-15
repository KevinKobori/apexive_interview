import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailPageStateLoadedSuccessView extends StatelessWidget {
  final String pictureDate;
  final PictureViewModel pictureViewModel;

  const PictureDetailPageStateLoadedSuccessView({
    super.key,
    required this.pictureDate,
    required this.pictureViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return PictureDetailLayout(
      pictureViewModel: pictureViewModel,
    );
  }
}

/// State dependencies :
/// * [AccountOverviewBloc]
/// * [NotificationsOverviewBloc]
/// * [CollectionsOverviewBloc]
class PictureDetailLayout extends StatefulWidget {
  final PictureViewModel pictureViewModel;

  const PictureDetailLayout({
    super.key,
    required this.pictureViewModel,
  });

  @override
  State<PictureDetailLayout> createState() => _PictureDetailLayoutState();
}

class _PictureDetailLayoutState extends State<PictureDetailLayout> {
  double _aspectRatio = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAspectRatio();
  }

  Future<void> _loadAspectRatio() async {
    try {
      final double aspectRatio =
          await ImageHelper.getImageAspectRatio(widget.pictureViewModel.url);
      if (mounted) {
        setState(() {
          _aspectRatio = aspectRatio;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ApodTheme.of(context);
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ApodScaffold(
        backgroundImage:
            CachedNetworkImageProvider(widget.pictureViewModel.url),
        body: ApodContentSheet(
          children: _buildBody(context, theme, widget.pictureViewModel),
        ),
        floatingBar: PictureDetailNavigationBar(
          accountOverviewPresenter: Modular.get<AccountOverviewBloc>(),
          collectionsOverviewPresenter: Modular.get<CollectionsOverviewBloc>(),
          notificationsOverviewPresenter:
              Modular.get<NotificationsOverviewBloc>(),
        ),
      );
    }
  }

  List<Widget> _buildBody(
      BuildContext context, ApodThemeData theme, PictureViewModel picture) {
    return [
      ClipRRect(
        borderRadius: theme.radius.asBorderRadius().regular,
        child: AspectRatio(
          aspectRatio: _aspectRatio,
          child: Image(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              picture.url,
            ),
          ),
        ),
      ),
      ApodGap.semiSmall(),
      ApodText.title1(picture.title),
      ApodText.title3(
        picture.date,
        color: theme.colors.accent,
      ),
      ApodText.paragraph1(picture.explanation),
      const SizedBox(
        height: 100,
      ),
    ];
  }
}
