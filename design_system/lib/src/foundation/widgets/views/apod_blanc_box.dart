import 'dart:developer';

import 'package:flutter/widgets.dart';
// import 'package:logger/logger.dart';

class ApodBlancBox extends StatelessWidget {
  final String? logMessage;
  const ApodBlancBox({
    super.key,
    this.logMessage,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(all): Create a way to save this log
    if (logMessage != null) {
      log(logMessage!);
    }
    return const SizedBox.shrink();
  }
}
