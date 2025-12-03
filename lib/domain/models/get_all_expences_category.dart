import 'dart:convert';

GetAllProductTypeModel getAllProductTypeModelFromJson(String str) => GetAllProductTypeModel.fromJson(json.decode(str));

String getAllProductTypeModelToJson(GetAllProductTypeModel data) => json.encode(data.toJson());

class GetAllProductTypeModel {
    final String message;
    final GetAllProductData data;
    final int status;
    final bool isSuccess;

    GetAllProductTypeModel({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    GetAllProductTypeModel copyWith({
        String? message,
        GetAllProductData? data,
        int? status,
        bool? isSuccess,
    }) => 
        GetAllProductTypeModel(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory GetAllProductTypeModel.fromJson(Map<String, dynamic> json) => GetAllProductTypeModel(
        message: json["Message"],
        data: GetAllProductData.fromJson(json["Data"]),
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

class GetAllProductData {
    final List<GetAllProductDatum> data;
    final int total;
    final int page;
    final int limit;

    GetAllProductData({
        required this.data,
        required this.total,
        required this.page,
        required this.limit,
    });

    GetAllProductData copyWith({
        List<GetAllProductDatum>? data,
        int? total,
        int? page,
        int? limit,
    }) => 
        GetAllProductData(
            data: data ?? this.data,
            total: total ?? this.total,
            page: page ?? this.page,
            limit: limit ?? this.limit,
        );

    factory GetAllProductData.fromJson(Map<String, dynamic> json) => GetAllProductData(
        data: List<GetAllProductDatum>.from(json["data"].map((x) => GetAllProductDatum.fromJson(x))),
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "page": page,
        "limit": limit,
    };
}

class GetAllProductDatum {
    final String id;
    final String name;
    final bool status;
    final bool isDeleted;
    final String deletedBy;
    final String createdBy;
    final String updatedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    GetAllProductDatum({
        required this.id,
        required this.name,
        required this.status,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdBy,
        required this.updatedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    GetAllProductDatum copyWith({
        String? id,
        String? name,
        bool? status,
        bool? isDeleted,
        String? deletedBy,
        String? createdBy,
        String? updatedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        GetAllProductDatum(
            id: id ?? this.id,
            name: name ?? this.name,
            status: status ?? this.status,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdBy: createdBy ?? this.createdBy,
            updatedBy: updatedBy ?? this.updatedBy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory GetAllProductDatum.fromJson(Map<String, dynamic> json) => GetAllProductDatum(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
