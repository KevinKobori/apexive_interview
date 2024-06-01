import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
  });

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final bloc = Modular.get<MainBloc>();

  @override
  void initState() {
    bloc.add(const ToggleThemeMode(ThemeMode.light));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: bloc,
      builder: (context, state) {
        ///
        Widget loading() =>
            const Center(child: CircularProgressIndicator.adaptive());

        Widget loaded(ThemeMode themeMode) => ApodAppBuilder(
              showSemanticsDebugger: false,
              debugShowCheckedModeBanner: false,
              routerConfig: Modular.routerConfig,
              themeMode: themeMode,
            );

        if (state is MainLoading) {
          return loading();
        } else if (state is MainLoaded) {
          return loaded(state.themeMode);
        } else {
          return const ApodBlancBox();
        }
      },
    );
  }
}
