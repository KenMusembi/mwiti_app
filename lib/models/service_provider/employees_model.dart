// To parse this JSON data, do
//
//     final getEmployeesModel = getEmployeesModelFromJson(jsonString);

import 'dart:convert';

List<GetEmployeesModel> getEmployeesModelFromJson(String str) =>
    List<GetEmployeesModel>.from(
        json.decode(str).map((x) => GetEmployeesModel.fromJson(x)));

String getEmployeesModelToJson(List<GetEmployeesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetEmployeesModel {
  GetEmployeesModel({
    this.id,
    this.workPeriod,
    this.passportPhoto,
    this.dateOfBirth,
    this.gender,
    this.religion,
    this.ethnicity,
    this.highestEducationLevel,
    this.experience,
    this.bio,
    this.status,
    this.rating,
    this.userIdId,
  });

  int? id;
  String? workPeriod;
  String? passportPhoto;
  DateTime? dateOfBirth;
  String? gender;
  String? religion;
  String? ethnicity;
  String? highestEducationLevel;
  String? experience;
  String? bio;
  String? status;
  String? rating;
  int? userIdId;

  factory GetEmployeesModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeesModel(
        id: json["id"],
        workPeriod: json["work_period"],
        passportPhoto: json["passport_photo"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        religion: json["religion"],
        ethnicity: json["ethnicity"],
        highestEducationLevel: json["highest_education_level"],
        experience: json["experience"],
        bio: json["bio"],
        status: json["status"],
        rating: json["rating"],
        userIdId: json["user_id_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "work_period": workPeriod,
        "passport_photo": passportPhoto,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "religion": religion,
        "ethnicity": ethnicity,
        "highest_education_level": highestEducationLevel,
        "experience": experience,
        "bio": bio,
        "status": status,
        "rating": rating,
        "user_id_id": userIdId,
      };
}
