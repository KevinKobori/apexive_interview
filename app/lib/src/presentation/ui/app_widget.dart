import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppWrapWidget extends StatefulWidget {
  const AppWrapWidget({
    super.key,
  });

  @override
  State<AppWrapWidget> createState() => _AppWrapWidgetState();
}

class _AppWrapWidgetState extends State<AppWrapWidget> {
  final bloc = Modular.get<AppWrapBloc>();

  @override
  void initState() {
    bloc.add(const AppWrapSwitchThemeMode(ThemeMode.light));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppWrapBloc, AppWrapState>(
      bloc: bloc,
      builder: (context, state) {
        Widget loading() => const Center(child: CircularProgressIndicator());

        Widget loaded(ThemeMode themeMode) => ApodAppBuilder(
              routerConfig: Modular.routerConfig,
              themeMode: themeMode,
            );

        Widget component = const BlancBox();

        if (state is AppWrapLoading) {
          component = loading();
        } else if (state is AppWrapLoaded) {
          component = loaded(state.themeMode);
        }

        return component;
      },
    );
  }
}
