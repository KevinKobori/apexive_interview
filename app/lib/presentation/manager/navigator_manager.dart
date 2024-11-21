import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

abstract final class NavigatorManager {
  static void pop() {
    if (Modular.to.canPop()) {
      Modular.to.pop();
      return;
    }
  }

  static Future<void> pushNamed(String route, {dynamic arguments}) async {
    if (route == Modular.to.path) {
      return;
    }

    await Modular.to
        .pushNamed(route, arguments: arguments)
        .onError((error, stackTrace) => log(error.toString()));
  }
}
