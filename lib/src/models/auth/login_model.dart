import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class ReqLoginModel {
  String? username;
  String? password;

  ReqLoginModel({this.username, this.password});

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ReqLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqLoginModelToJson(this);
}

@JsonSerializable()
class ResLoginModel {
  String? message;
  LoginModel? data;

  ResLoginModel({this.message, this.data});

  factory ResLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResLoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginModel {
  int? id;
  String? accessToken;
  String? refreshToken;
  String? name;
  String? surname;
  String? email;
  String? username;
  @JsonKey(name: "phone_number")
  String? phoneNumber;

  LoginModel(
      {this.id,
      this.name,
      this.surname,
      this.accessToken,
      this.refreshToken,
      this.email,
      this.username,
      this.phoneNumber});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
