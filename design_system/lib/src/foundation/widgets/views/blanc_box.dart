import 'package:flutter/widgets.dart';
// import 'package:logger/logger.dart';

class BlancBox extends StatelessWidget {
  final String? logMessage;
  const BlancBox({
    super.key,
    this.logMessage,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(all): Create a way to save this log
    // log(logMessage);
    return const SizedBox.shrink();
  }
}
