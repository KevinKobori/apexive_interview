import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

import '../../base/view.dart';

void main() {
  testAppView(
    'features/catalog',
    BlocProvider(
      create: (context) => NotificationsOverviewBloc(),
      child: BlocProvider(
        create: (context) => CollectionsOverviewBloc(),
        child: BlocProvider(
          create: (context) => AccountOverviewBloc(),
          child: CatalogPageLoadedSuccessView(
            catalog: [],
            onLoadPictureByDate: (date) {},
            catalogPagePresenter: catalogPagePresenterFactory(),
            onLoadCatalog: () {},
          ),
        ),
      ),
    ),
  );
}
