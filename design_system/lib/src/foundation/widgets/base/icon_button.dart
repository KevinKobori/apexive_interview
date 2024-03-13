import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodIconButton extends IconButton {
  const ApodIconButton({
    required ApodIcon icon,
    required super.onPressed,
    super.key,
  }) : super(icon: icon);
}
