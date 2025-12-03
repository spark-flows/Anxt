import 'dart:convert';

GetOneTripModel getOneTripModelFromJson(String str) => GetOneTripModel.fromJson(json.decode(str));

String getOneTripModelToJson(GetOneTripModel data) => json.encode(data.toJson());

class GetOneTripModel {
    final String message;
    final GetOneTripData data;
    final int status;
    final bool isSuccess;

    GetOneTripModel({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    GetOneTripModel copyWith({
        String? message,
        GetOneTripData? data,
        int? status,
        bool? isSuccess,
    }) => 
        GetOneTripModel(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory GetOneTripModel.fromJson(Map<String, dynamic> json) => GetOneTripModel(
        message: json["Message"],
        data: GetOneTripData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data.toJson(),
        "Status": status,
        "IsSuccess": isSuccess,
    };
}

class GetOneTripData {
    final String id;
    final String branchid;
    final String tripname;
    final String purpose;
    final String status;
    final int budget;
    final DateTime start;
    final DateTime end;
    final String location;
    final String remark;
    final List<Participant> participants;
    final bool isDeleted;
    final String deletedBy;
    final String createdBy;
    final String updatedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    GetOneTripData({
        required this.id,
        required this.branchid,
        required this.tripname,
        required this.purpose,
        required this.status,
        required this.budget,
        required this.start,
        required this.end,
        required this.location,
        required this.remark,
        required this.participants,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdBy,
        required this.updatedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    GetOneTripData copyWith({
        String? id,
        String? branchid,
        String? tripname,
        String? purpose,
        String? status,
        int? budget,
        DateTime? start,
        DateTime? end,
        String? location,
        String? remark,
        List<Participant>? participants,
        bool? isDeleted,
        String? deletedBy,
        String? createdBy,
        String? updatedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        GetOneTripData(
            id: id ?? this.id,
            branchid: branchid ?? this.branchid,
            tripname: tripname ?? this.tripname,
            purpose: purpose ?? this.purpose,
            status: status ?? this.status,
            budget: budget ?? this.budget,
            start: start ?? this.start,
            end: end ?? this.end,
            location: location ?? this.location,
            remark: remark ?? this.remark,
            participants: participants ?? this.participants,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdBy: createdBy ?? this.createdBy,
            updatedBy: updatedBy ?? this.updatedBy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory GetOneTripData.fromJson(Map<String, dynamic> json) => GetOneTripData(
        id: json["_id"]??"",
        branchid: json["branchid"]??"",
        tripname: json["tripname"]??"",
        purpose: json["purpose"]??"",
        status: json["status"]??"",
        budget: json["budget"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        location: json["location"]??"",
        remark: json["remark"]??"",
        participants:json["participants"] == null ? [] : List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
        isDeleted: json["isDeleted"] ?? false,
        deletedBy: json["deletedBy"] ??"",
        createdBy: json["createdBy"] ?? "",
        updatedBy: json["updatedBy"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ??0,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "branchid": branchid,
        "tripname": tripname,
        "purpose": purpose,
        "status": status,
        "budget": budget,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "location": location,
        "remark": remark,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Participant {
    final String id;
    final String name;
    final String email;

    Participant({
        required this.id,
        required this.name,
        required this.email,
    });

    Participant copyWith({
        String? id,
        String? name,
        String? email,
    }) => 
        Participant(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
        );

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
    };
}
