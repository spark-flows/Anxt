// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? message;
  List<UserData>? data;
  int? status;
  bool? isSuccess;

  UserModel({this.message, this.data, this.status, this.isSuccess});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["Message"],
    data:
        json["Data"] == null
            ? []
            : List<UserData>.from(json["Data"]!.map((x) => UserData.fromJson(x))),
    status: json["Status"],
    isSuccess: json["IsSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class UserData {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  Roleid? roleid;
  bool? status;
  bool? isDeleted;
  dynamic deletedBy;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserData({
    this.id,
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.roleid,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    roleid: json["roleid"] == null ? null : Roleid.fromJson(json["roleid"]),
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy:
        json["createdBy"] == null ? null : AtedBy.fromJson(json["createdBy"]),
    updatedBy:
        json["updatedBy"] == null ? null : AtedBy.fromJson(json["updatedBy"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "code": code,
    "name": name,
    "email": email,
    "mobile": mobile,
    "roleid": roleid?.toJson(),
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy?.toJson(),
    "updatedBy": updatedBy?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class AtedBy {
  String? id;
  String? name;
  String? profilepic;

  AtedBy({this.id, this.name, this.profilepic});

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
    id: json["_id"],
    name: json["name"],
    profilepic: json["profilepic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "profilepic": profilepic,
  };
}

class Roleid {
  String? id;
  String? rolename;

  Roleid({this.id, this.rolename});

  factory Roleid.fromJson(Map<String, dynamic> json) =>
      Roleid(id: json["_id"], rolename: json["rolename"]);

  Map<String, dynamic> toJson() => {"_id": id, "rolename": rolename};
}
