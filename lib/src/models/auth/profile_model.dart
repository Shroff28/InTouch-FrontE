import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ReqProfileModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? city;
  String? country;
  String? dateOfBirth;
  String? state;
  String? postalCode;

  ReqProfileModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.address,
      this.city,
      this.country,
      this.dateOfBirth,
      this.state,
      this.postalCode});

  factory ReqProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ReqProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqProfileModelToJson(this);
}
