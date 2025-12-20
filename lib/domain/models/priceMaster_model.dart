// To parse this JSON data, do
//
//     final priceMasterListModel = priceMasterListModelFromJson(jsonString);

import 'dart:convert';

PriceMasterListModel priceMasterListModelFromJson(String str) =>
    PriceMasterListModel.fromJson(json.decode(str));

String priceMasterListModelToJson(PriceMasterListModel data) =>
    json.encode(data.toJson());

class PriceMasterListModel {
  String? message;
  PriceMasterListData? data;
  int? status;
  bool? isSuccess;

  PriceMasterListModel({this.message, this.data, this.status, this.isSuccess});

  factory PriceMasterListModel.fromJson(Map<String, dynamic> json) =>
      PriceMasterListModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : PriceMasterListData.fromJson(json["Data"]),
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

class PriceMasterListData {
  List<PriceMasterListDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  PriceMasterListData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory PriceMasterListData.fromJson(Map<String, dynamic> json) =>
      PriceMasterListData(
        docs:
            json["docs"] == null
                ? []
                : List<PriceMasterListDoc>.from(
                  json["docs"]!.map((x) => PriceMasterListDoc.fromJson(x)),
                ),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
    "docs":
        docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class PriceMasterListDoc {
  String? id;
  String? name;
  bool? status;
  bool? isDeleted;
  dynamic deletedBy;
  PriceMasterListCreatedBy? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? docId;

  PriceMasterListDoc({
    this.id,
    this.name,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.docId,
  });

  factory PriceMasterListDoc.fromJson(
    Map<String, dynamic> json,
  ) => PriceMasterListDoc(
    id: json["_id"],
    name: json["name"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy:
        json["createdBy"] == null
            ? null
            : PriceMasterListCreatedBy.fromJson(json["createdBy"]),
    updatedBy: json["updatedBy"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    docId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy?.toJson(),
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "id": docId,
  };
}

class PriceMasterListCreatedBy {
  String? id;
  String? name;

  PriceMasterListCreatedBy({this.id, this.name});

  factory PriceMasterListCreatedBy.fromJson(Map<String, dynamic> json) =>
      PriceMasterListCreatedBy(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
