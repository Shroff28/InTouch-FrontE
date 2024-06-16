import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class ReqRegisterModel {
  String? email;
  String? username;
  String? password;

  ReqRegisterModel({
    this.email,
    this.username,
    this.password,
  });

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRegisterModelToJson(this);
}

@JsonSerializable()
class ReqResetPasswordModel {
  String? otp;
  String? password;

  ReqResetPasswordModel({
    this.otp,
    this.password,
  });

  factory ReqResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ReqResetPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqResetPasswordModelToJson(this);
}
