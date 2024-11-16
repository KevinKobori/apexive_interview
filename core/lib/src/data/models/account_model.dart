import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'picture_url') required String pictureUrl,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, Object?> json) =>
      _$AccountModelFromJson(json);
}
