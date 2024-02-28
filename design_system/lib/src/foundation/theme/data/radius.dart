import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodRadiusData extends XRadiusData {
  const ApodRadiusData()
      : super(
          extraSmall: const Radius.circular(5),
          small: const Radius.circular(10),
          semiSmall: const Radius.circular(12),
          medium: const Radius.circular(16),
          large: const Radius.circular(24),
        );

  @override
  Radius get semiLarge =>
      throw UnimplementedError('semiLarge is not available in ApodRadiusData');

  @override
  Radius get extraLarge =>
      throw UnimplementedError('extraLarge is not available in ApodRadiusData');

  @override
  Radius get superLarge =>
      throw UnimplementedError('superLarge is not available in ApodRadiusData');

  @override
  ApodBorderRadiusData get border => ApodBorderRadiusData(this);
}

class ApodBorderRadiusData extends XBorderRadiusData {
  const ApodBorderRadiusData(ApodRadiusData radius) : super(radius);

  @override
  BorderRadius get semiLarge => throw UnimplementedError(
      'semiLarge is not available in ApodBorderRadiusData');

  @override
  BorderRadius get extraLarge => throw UnimplementedError(
      'extraLarge is not available in ApodBorderRadiusData');

  @override
  BorderRadius get superLarge => throw UnimplementedError(
      'superLarge is not available in ApodBorderRadiusData');

  @override
  ApodShapesData get shape => ApodShapesData(this);
}

class ApodShapesData extends XShapesData {
  const ApodShapesData(ApodBorderRadiusData borderRadius) : super(borderRadius);

  @override
  RoundedRectangleBorder get semiLarge =>
      throw UnimplementedError('semiLarge is not available in ApodShapesData');

  @override
  RoundedRectangleBorder get extraLarge =>
      throw UnimplementedError('extraLarge is not available in ApodShapesData');

  @override
  RoundedRectangleBorder get superLarge =>
      throw UnimplementedError('superLarge is not available in ApodShapesData');
}
