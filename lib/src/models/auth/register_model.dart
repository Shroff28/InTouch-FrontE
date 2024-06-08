import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class ReqRegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? password;
  @JsonKey(name: "phone_number")
  String? phoneNumber;

  ReqRegisterModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.password,
      this.phoneNumber});

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRegisterModelToJson(this);
}