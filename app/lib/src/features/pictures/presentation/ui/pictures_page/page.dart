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
  @override
  void initState() {
    widget.picturesPagePresenter.loadPictures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesPageCubit, PicturesPageState>(
      bloc: widget.picturesPagePresenter as PicturesPageCubit,
      builder: (context, state) {
        if (state is PicturesPageStateLoading) {
          return PicturesPageStateLoadingView(
            picturesPagePresenter: widget.picturesPagePresenter,
          );
        } else if (state is PicturesPageStateLoadedFailure) {
          return PicturesPageStateLoadedFailureView(
            failureMessage: state.failureMessage,
            onReload: widget.picturesPagePresenter.loadPictures,
          );
        } else if (state is PicturesPageStateLoadedSuccess) {
          return PicturesPageStateLoadedSuccessView(
            picturesPagePresenter: widget.picturesPagePresenter,
            pictureViewModelList: state.pictureViewModelList,
            onLoadAllPicturesList: widget.picturesPagePresenter.loadPictures,
            onLoadPictureByDate: (date) => widget.picturesPagePresenter
                .loadPictureByDate(context, date: date),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
