// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.emailVerified,
    this.phoneNumber,
    this.password,
    this.token,
  });

  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? phoneNumber;
  String? password;
  String? token;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerified: json["email_verified"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "email_verified": emailVerified,
        "phone_number": phoneNumber,
        "password": password,
        "token": token,
      };
}
