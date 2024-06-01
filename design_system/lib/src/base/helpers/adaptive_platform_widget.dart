import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class AdaptivePlatformWidget extends StatelessWidget {
  const AdaptivePlatformWidget({super.key});

  Widget get android;
  Widget get ios;
  Widget get windows;
  Widget get linux;
  Widget get macos;
  Widget get fuchsia;
  Widget get web;
  Widget get standard;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? android
        : Platform.isIOS
            ? ios
            : Platform.isFuchsia
                ? fuchsia
                : Platform.isLinux
                    ? linux
                    : Platform.isMacOS
                        ? macos
                        : Platform.isWindows
                            ? windows
                            : standard;
  }
}
