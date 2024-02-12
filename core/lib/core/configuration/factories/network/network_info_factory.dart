import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

DeviceInfo networkInfoFactory() => DeviceInfoImpl(Connectivity());
