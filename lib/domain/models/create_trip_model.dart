import 'dart:convert';

TripCreatedModel tripCreatedModelFromJson(String str) => TripCreatedModel.fromJson(json.decode(str));

String tripCreatedModelToJson(TripCreatedModel data) => json.encode(data.toJson());

class TripCreatedModel {
    final String message;
    final Data data;
    final int status;
    final bool isSuccess;

    TripCreatedModel({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    TripCreatedModel copyWith({
        String? message,
        Data? data,
        int? status,
        bool? isSuccess,
    }) => 
        TripCreatedModel(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory TripCreatedModel.fromJson(Map<String, dynamic> json) => TripCreatedModel(
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
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

class Data {
    final String tripname;
    final String purpose;
    final String status;
    final int budget;
    final DateTime start;
    final DateTime end;
    final String location;
    final String remark;
    final List<String> participants;
    final bool isDeleted;
    final String deletedBy;
    final String createdBy;
    final String updatedBy;
    final String id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Data({
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
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    Data copyWith({
        String? tripname,
        String? purpose,
        String? status,
        int? budget,
        DateTime? start,
        DateTime? end,
        String? location,
        String? remark,
        List<String>? participants,
        bool? isDeleted,
        String? deletedBy,
        String? createdBy,
        String? updatedBy,
        String? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        Data(
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
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tripname: json["tripname"],
        purpose: json["purpose"],
        status: json["status"],
        budget: json["budget"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        location: json["location"],
        remark: json["remark"],
        participants: List<String>.from(json["participants"].map((x) => x)),
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "tripname": tripname,
        "purpose": purpose,
        "status": status,
        "budget": budget,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "location": location,
        "remark": remark,
        "participants": List<dynamic>.from(participants.map((x) => x)),
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
