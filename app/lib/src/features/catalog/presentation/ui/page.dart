import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class CatalogPage extends StatefulWidget {
  final CatalogPagePresenter catalogPagePresenter;

  const CatalogPage({
    required this.catalogPagePresenter,
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late CatalogPageBloc bloc;
  @override
  void initState() {
    bloc = widget.catalogPagePresenter as CatalogPageBloc;
    bloc.add(CatalogPageLoadCatalog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogPageBloc, CatalogPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CatalogPageLoading) {
          return CatalogPageLoadingView(
            catalogPagePresenter: bloc,
          );
        } else if (state is CatalogPageLoadedFailure) {
          return CatalogPageLoadedFailureView(
            failureMessage: state.message,
            onReload: () => bloc.add(CatalogPageLoadCatalog()),
            // bloca.loadPictures,
          );
        } else if (state is CatalogPageLoadedSuccess) {
          return CatalogPageLoadedSuccessView(
            catalogPagePresenter: bloc,
            catalog: state.catalog,
            onLoadCatalog: () =>
                bloc.add(CatalogPageLoadCatalog()),
            // bloca.loadPictures,
            onLoadPictureByDate: (date) =>
                bloc.add(CatalogPageLoadPictureByDate(date)),
            // => bloca
            //     .loadPictureByDate(context, date: date),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
