import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

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
    bloc.add(const CatalogPageLoadCatalog());
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
            onReload: () => bloc.add(const CatalogPageLoadCatalog()),
          );
        } else if (state is CatalogPageLoadedSuccess) {
          return CatalogPageLoadedSuccessView(
            catalog: state.catalog,
            onLoadCatalog: () => bloc.add(const CatalogPageLoadCatalog()),
            onLoadPictureByDate: (date) =>
                bloc.add(CatalogPageLoadPictureByDate(date)),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
