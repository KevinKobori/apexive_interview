import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CatalogPage extends StatefulWidget {
  final CatalogPagePresenter pagePresenter;

  const CatalogPage({
    required this.pagePresenter,
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late CatalogPageBloc bloc;

  @override
  void initState() {
    bloc = widget.pagePresenter as CatalogPageBloc;
    bloc.add(const LoadCatalog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogPageBloc, CatalogPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CatalogPageLoading) {
          return const CatalogPageLoadingView();
        } else if (state is CatalogPageLoadedFailure) {
          return CatalogPageLoadedFailureView(
            failureMessage: state.message,
            onReload: () => bloc.add(const LoadCatalog()),
          );
        } else if (state is CatalogPageLoadedSuccess) {
          return CatalogPageLoadedSuccessView(
            catalog: state.catalog,
            onLoadCatalog: () => bloc.add(const LoadCatalog()),
            onLoadPictureByDate: (date) => bloc.add(LoadPictureByDate(date)),
            onPushToPictureDetail: (picture) =>
                bloc.add(GoToPictureDetail(picture)),
          );
        } else {
          return const ApodBlancBox(
              logMessage: 'This can not happen. [CatalogPage]');
        }
      },
    );
  }
}
