import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<AppWrapBloc>();

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        Widget loading() => const Center(child: CircularProgressIndicator());

        Widget loaded(bool value) => Switch(
              value: value,
              onChanged: (newValue) {
                if (newValue == true) {
                  bloc.add(const ToggleThemeModeEvent(ThemeMode.dark));
                } else {
                  bloc.add(const ToggleThemeModeEvent(ThemeMode.light));
                }
              },
            );

        Widget component = const BlancBox();

        if (state is AppWrapLoading) {
          component = loading();
        } else if (state is AppWrapLoaded) {
          if (state.themeMode == ThemeMode.light) {
            component = loaded(false);
          } else if (state.themeMode == ThemeMode.dark) {
            component = loaded(true);
          }
        }

        return component;
      },
    );
  }
}
