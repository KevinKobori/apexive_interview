import 'package:nasa_apod_core/nasa_apod_core.dart';

class EnUs implements Translation {
  /// Failures
  @override
  String get unexpectedFailure => 'Unexpected Failure!';
  @override
  String get notHaveInternetConnectionFailure =>
      'Check your internet connection and try again!';
  @override
  String get invalidDataFailure => 'Invalid data!';
  @override
  String get resourceNotFoundFailure => 'Resource Not found!';
  @override
  String get dataNotFoundFailure => 'Data Not found!';
  @override
  String get internalServerErrorFailure => 'Server error!';

  /// Strings
  @override
  String get reload => 'Reload!';
}
