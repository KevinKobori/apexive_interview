import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CollectionsOverview extends StatelessWidget {
  final CollectionsOverviewBloc collectionsOverviewPresenter;

  const CollectionsOverview({
    required this.collectionsOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CollectionsOverviewBloc, CollectionsOverviewState>(
      bloc: collectionsOverviewPresenter,
      builder: (context, state) {
        if (state is CollectionsOverviewStateLoadedData) {
          final itemCount = state.collectionList.length;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ApodText.custom(
                        '$itemCount',
                        style: textTheme.titleSmall!.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                      Icon(
                        Icons.bookmark,
                        color: colors.onSurface,
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
