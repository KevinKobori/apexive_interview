import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodThemeSwitch extends StatelessWidget {
  const ApodThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<MainBloc>();

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        Widget loading() =>
            const Center(child: CircularProgressIndicator.adaptive());

        Widget loaded(bool value) => ApodSwitch.adaptive(
              value: value,
              onChanged: (newValue) {
                if (newValue == true) {
                  bloc.add(const ToggleThemeMode(ThemeMode.dark));
                } else {
                  bloc.add(const ToggleThemeMode(ThemeMode.light));
                }
              },
            );

        Widget component = const ApodBlancBox();

        if (state is MainLoading) {
          component = loading();
        } else if (state is MainLoaded) {
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
