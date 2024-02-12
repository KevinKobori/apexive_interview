import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String name,
    required String pictureUrl,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, Object?> json) =>
      _$AccountModelFromJson(json);
}
