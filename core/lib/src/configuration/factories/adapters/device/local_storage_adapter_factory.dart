import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_core/nasa_apod_core.dart';

LocalStorage localStorageAdapterFactory(String keyPath) =>
    LocalStorageAdapter(localStorage: ls.LocalStorage(keyPath));
