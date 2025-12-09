import 'dart:convert';

GetAllFileAndFolder getAllFileAndFolderFromJson(String str) =>
    GetAllFileAndFolder.fromJson(json.decode(str));

String getAllFileAndFolderToJson(GetAllFileAndFolder data) =>
    json.encode(data.toJson());

class GetAllFileAndFolder {
  final String message;
  final GetAllFileData data;
  final int status;
  final bool isSuccess;

  GetAllFileAndFolder({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  GetAllFileAndFolder copyWith({
    String? message,
    GetAllFileData? data,
    int? status,
    bool? isSuccess,
  }) => GetAllFileAndFolder(
    message: message ?? this.message,
    data: data ?? this.data,
    status: status ?? this.status,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  factory GetAllFileAndFolder.fromJson(Map<String, dynamic> json) =>
      GetAllFileAndFolder(
        message: json["Message"],
        data: GetAllFileData.fromJson(json["Data"]),
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

class GetAllFileData {
  final List<GetAllFileDoc> docs;
  final int totalCount;
  final int totalPages;
  final int page;
  final int limit;

  GetAllFileData({
    required this.docs,
    required this.totalCount,
    required this.totalPages,
    required this.page,
    required this.limit,
  });

  GetAllFileData copyWith({
    List<GetAllFileDoc>? docs,
    int? totalCount,
    int? totalPages,
    int? page,
    int? limit,
  }) => GetAllFileData(
    docs: docs ?? this.docs,
    totalCount: totalCount ?? this.totalCount,
    totalPages: totalPages ?? this.totalPages,
    page: page ?? this.page,
    limit: limit ?? this.limit,
  );

  factory GetAllFileData.fromJson(Map<String, dynamic> json) => GetAllFileData(
    docs: List<GetAllFileDoc>.from(
      json["docs"].map((x) => GetAllFileDoc.fromJson(x)),
    ),
    totalCount: json["totalCount"],
    totalPages: json["totalPages"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "totalCount": totalCount,
    "totalPages": totalPages,
    "page": page,
    "limit": limit,
  };
}

class GetAllFileDoc {
  final String id;
  final String parentid;
  final String name;
  final bool status;
  final DateTime createdAt;
  final List<GetAllFileDoc> subCategories;
  final int totalProducts;
  bool isSelect = false;

  GetAllFileDoc({
    required this.id,
    required this.parentid,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.subCategories,
    required this.totalProducts,
required this.isSelect,
  });

  GetAllFileDoc copyWith({
    String? id,
    String? parentid,
    String? name,
    bool? status,
    DateTime? createdAt,
    List<GetAllFileDoc>? subCategories,
    int? totalProducts,
    bool? isSelect,
  }) => GetAllFileDoc(
    id: id ?? this.id,
    parentid: parentid ?? this.parentid,
    name: name ?? this.name,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    subCategories: subCategories ?? this.subCategories,
    totalProducts: totalProducts ?? this.totalProducts,
    isSelect: isSelect ?? this.isSelect,
  );

  factory GetAllFileDoc.fromJson(Map<String, dynamic> json) => GetAllFileDoc(
    id: json["_id"],
    parentid: json["parentid"],
    name: json["name"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    subCategories: List<GetAllFileDoc>.from(
      json["subCategories"].map((x) => GetAllFileDoc.fromJson(x)),
    ),
    totalProducts: json["totalProducts"],
    isSelect: json["isSelect"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "parentid": parentid,
    "name": name,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    "totalProducts": totalProducts,
    "isSelect": isSelect,
  };
}
