// To parse this JSON data, do
//
//     final resendOtp = resendOtpFromJson(jsonString);

import 'dart:convert';

ResendOtp resendOtpFromJson(String str) => ResendOtp.fromJson(json.decode(str));

String resendOtpToJson(ResendOtp data) => json.encode(data.toJson());

class ResendOtp {
  ResendOtp({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory ResendOtp.fromJson(Map<String, dynamic> json) => ResendOtp(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
