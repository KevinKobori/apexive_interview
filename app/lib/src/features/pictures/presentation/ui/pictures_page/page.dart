import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPage({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  late PicturesPageBloc bloc;
  @override
  void initState() {
    bloc = widget.picturesPagePresenter as PicturesPageBloc;
    // bloca.loadPictures();
    bloc.add(PicturesPageEventLoadPictures());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesPageBloc, PicturesPageState>(
      // BlocBuilder<PicturesPageCubit, PicturesPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is PicturesPageStateLoading) {
          return PicturesPageStateLoadingView(
            picturesPagePresenter: bloc,
          );
        } else if (state is PicturesPageStateLoadedFailure) {
          return PicturesPageStateLoadedFailureView(
            failureMessage: state.failureMessage,
            onReload: () => bloc.add(PicturesPageEventLoadPictures()),
            // bloca.loadPictures,
          );
        } else if (state is PicturesPageStateLoadedSuccess) {
          return PicturesPageStateLoadedSuccessView(
            picturesPagePresenter: bloc,
            pictureViewModelList: state.pictureViewModelList,
            onLoadAllPicturesList: () =>
                bloc.add(PicturesPageEventLoadPictures()),
            // bloca.loadPictures,
            onLoadPictureByDate: (date) =>
                bloc.add(PicturesPageEventLoadPictureByDate(date)),
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
