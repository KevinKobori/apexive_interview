import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<NotificationsOverviewBloc>(
        () => NotificationsOverviewBloc());
    i.addLazySingleton<CollectionsOverviewBloc>(
        () => CollectionsOverviewBloc());
    i.addLazySingleton<AccountOverviewBloc>(() => AccountOverviewBloc());
  }

  @override
  void routes(r) {
    r.module('/', module: CatalogModule());
    r.child(
      '/picture/detail/:picture_date',
      child: (context) => pictureDetailPageFactory(
        pictureDate: r.args.params['picture_date']!,
      ),
    );
  }
}
