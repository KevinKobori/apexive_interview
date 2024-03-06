import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodMetrics {
  static XMetricsData data(XFormFactor? formFactor) {
    return XMetricsData(
      spacings: ApodSpacings.data,
      durations: ApodDurations.data,
      radius: ApodRadius.data,
      boxShadows: ApodBoxShadows.data,
      elevations: ApodElevations.data,
      formFactor: formFactor,
    );
  }
}
