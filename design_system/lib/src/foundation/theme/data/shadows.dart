import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodBoxShadowsData extends XBoxShadowsData {
  const ApodBoxShadowsData()
      : super(
          large: const BoxShadow(
            blurRadius: 32,
            color: Color(0x44000000),
          ),
        );

  @override
  BoxShadow get small =>
      throw UnimplementedError('small is not available in ApodBoxShadowsData');

  @override
  BoxShadow get medium =>
      throw UnimplementedError('medium is not available in ApodBoxShadowsData');
}
