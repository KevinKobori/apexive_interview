import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';

class ApodCachedNetworkImageProvider extends CachedNetworkImageProvider {
  ApodCachedNetworkImageProvider(super.url);
}

class ApodLocalStorage {
  final LocalStorage _localStorage;

  factory ApodLocalStorage(String key,
      [String? path, Map<String, dynamic>? initialData]) {
    return ApodLocalStorage._(LocalStorage(key, path, initialData));
  }

  ApodLocalStorage._(this._localStorage);

  dynamic getItem(String key) => _localStorage.getItem(key);

  Future<void> setItem(String key, dynamic value) =>
      _localStorage.setItem(key, value);

  Future<void> deleteItem(String key) => _localStorage.deleteItem(key);

  Future<void> clear() => _localStorage.clear();
}

class ApodSvgPicture extends SvgPicture {
  ApodSvgPicture.asset(super.assetName) : super.asset();
}
