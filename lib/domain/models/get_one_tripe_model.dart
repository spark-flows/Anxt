// To parse this JSON data, do
//
//     final getOneTripModel = getOneTripModelFromJson(jsonString);

import 'dart:convert';

GetOneTripModel getOneTripModelFromJson(String str) =>
    GetOneTripModel.fromJson(json.decode(str));

String getOneTripModelToJson(GetOneTripModel data) =>
    json.encode(data.toJson());

class GetOneTripModel {
  String? message;
  GetOneTripData? data;
  int? status;
  bool? isSuccess;

  GetOneTripModel({this.message, this.data, this.status, this.isSuccess});

  factory GetOneTripModel.fromJson(Map<String, dynamic> json) =>
      GetOneTripModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetOneTripData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Data": data?.toJson(),
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class GetOneTripData {
  String? id;
  String? tripname;
  String? purpose;
  String? status;
  String? currency;
  int? budget;
  String? start;
  String? end;
  String? location;
  String? remark;
  List<Participant>? participants;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? image;

  GetOneTripData({
    this.id,
    this.tripname,
    this.purpose,
    this.status,
    this.currency,
    this.budget,
    this.start,
    this.end,
    this.location,
    this.remark,
    this.participants,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
  });

  factory GetOneTripData.fromJson(Map<String, dynamic> json) => GetOneTripData(
    id: json["_id"],
    tripname: json["tripname"],
    purpose: json["purpose"],
    status: json["status"],
    currency: json["currency"],
    budget: json["budget"],
    start: json["start"],
    end: json["end"],
    location: json["location"],
    remark: json["remark"],
    participants:
        json["participants"] == null
            ? []
            : List<Participant>.from(
              json["participants"]!.map((x) => Participant.fromJson(x)),
            ),
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tripname": tripname,
    "purpose": purpose,
    "status": status,
    "currency": currency,
    "budget": budget,
    "start": start,
    "end": end,
    "location": location,
    "remark": remark,
    "participants":
        participants == null
            ? []
            : List<dynamic>.from(participants!.map((x) => x.toJson())),
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "image": image,
  };
}

class Participant {
  String? id;
  String? name;
  String? email;

  Participant({this.id, this.name, this.email});

  factory Participant.fromJson(Map<String, dynamic> json) =>
      Participant(id: json["_id"], name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name, "email": email};
}
