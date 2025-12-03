import 'dart:convert';

GetOneExpenseCategory getOneExpenseCategoryFromJson(String str) => GetOneExpenseCategory.fromJson(json.decode(str));

String getOneExpenseCategoryToJson(GetOneExpenseCategory data) => json.encode(data.toJson());

class GetOneExpenseCategory {
    final String message;
    final GetOneExpenseData data;
    final int status;
    final bool isSuccess;

    GetOneExpenseCategory({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    GetOneExpenseCategory copyWith({
        String? message,
        GetOneExpenseData? data,
        int? status,
        bool? isSuccess,
    }) => 
        GetOneExpenseCategory(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory GetOneExpenseCategory.fromJson(Map<String, dynamic> json) => GetOneExpenseCategory(
        message: json["Message"],
        data: GetOneExpenseData.fromJson(json["Data"]),
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

class GetOneExpenseData {
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

    GetOneExpenseData({
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

    GetOneExpenseData copyWith({
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
        GetOneExpenseData(
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

    factory GetOneExpenseData.fromJson(Map<String, dynamic> json) => GetOneExpenseData(
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
