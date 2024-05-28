import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class MainModule extends Module {
  static const String modulePath = '';

  /// PATHS
  static const String _pictureDetailsPath = '/picture/detail/date/';

  /// ROUTES
  static const pictureDetailsRoute = modulePath + _pictureDetailsPath;

  @override
  void binds(Injector i) {
    i.addLazySingleton<MainBloc>(() => MainBloc());
    i.addLazySingleton<NotificationsOverviewBloc>(
        () => NotificationsOverviewBloc());
    i.addLazySingleton<CollectionsOverviewBloc>(
        () => CollectionsOverviewBloc());
    i.addLazySingleton<AccountOverviewBloc>(() => AccountOverviewBloc());
  }

  @override
  void routes(r) {
    // TODO(all): NOW SET THE INITIAL PAGE TO REDIRECT TO '/catalog'
    r.module('/', module: CatalogModule());
    r.child(
      // TODO(all): NOW TEST THIS
      '$_pictureDetailsPath:picture_date',
      child: (context) => pictureDetailPageFactory(
        pictureDate: r.args.params['picture_date']! as String,
      ),
    );
  }
}
