import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  String? message;
  GetProfileData? data;
  int? status;
  bool? isSuccess;

  GetProfileModel({this.message, this.data, this.status, this.isSuccess});

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetProfileData.fromJson(json["Data"]),
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

class GetProfileData {
  GetProfileUserData? userData;
  GetProfilePermissionData? permissionData;

  GetProfileData({this.userData, this.permissionData});

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
    userData:
        json["userData"] == null
            ? null
            : GetProfileUserData.fromJson(json["userData"]),
    permissionData:
        json["permissionData"] == null
            ? null
            : GetProfilePermissionData.fromJson(json["permissionData"]),
  );

  Map<String, dynamic> toJson() => {
    "userData": userData?.toJson(),
    "permissionData": permissionData?.toJson(),
  };
}

class GetProfilePermissionData {
  String? id;
  String? rolename;
  List<GetProfilePermission>? permission;
  bool? status;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetProfilePermissionData({
    this.id,
    this.rolename,
    this.permission,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetProfilePermissionData.fromJson(
    Map<String, dynamic> json,
  ) => GetProfilePermissionData(
    id: json["_id"],
    rolename: json["rolename"],
    permission:
        json["permission"] == null
            ? []
            : List<GetProfilePermission>.from(
              json["permission"]!.map((x) => GetProfilePermission.fromJson(x)),
            ),
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rolename": rolename,
    "permission":
        permission == null
            ? []
            : List<dynamic>.from(permission!.map((x) => x.toJson())),
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class GetProfilePermission {
  String? collectionname;
  bool? create;
  bool? edit;
  bool? delete;
  bool? view;
  bool? status;
  bool? isglobal;
  bool? isown;
  bool? globalview;
  bool? isassign;
  bool? isbranch;
  String? id;

  GetProfilePermission({
    this.collectionname,
    this.create,
    this.edit,
    this.delete,
    this.view,
    this.status,
    this.isglobal,
    this.isown,
    this.globalview,
    this.isassign,
    this.isbranch,
    this.id,
  });

  factory GetProfilePermission.fromJson(Map<String, dynamic> json) =>
      GetProfilePermission(
        collectionname: json["collectionname"],
        create: json["create"],
        edit: json["edit"],
        delete: json["delete"],
        view: json["view"],
        status: json["status"],
        isglobal: json["isglobal"],
        isown: json["isown"],
        globalview: json["globalview"],
        isassign: json["isassign"],
        isbranch: json["isbranch"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
    "collectionname": collectionname,
    "create": create,
    "edit": edit,
    "delete": delete,
    "view": view,
    "status": status,
    "isglobal": isglobal,
    "isown": isown,
    "globalview": globalview,
    "isassign": isassign,
    "isbranch": isbranch,
    "_id": id,
  };
}

class GetProfileUserData {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? profilepic;
  bool? isVerified;
  bool? isActive;
  String? roleid;
  bool? status;
  dynamic deletedBy;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? code;
  String? branchid;

  GetProfileUserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profilepic,
    this.isVerified,
    this.isActive,
    this.roleid,
    this.status,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.code,
    this.branchid,
  });

  factory GetProfileUserData.fromJson(
    Map<String, dynamic> json,
  ) => GetProfileUserData(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    profilepic: json["profilepic"],
    isVerified: json["isVerified"],
    isActive: json["isActive"],
    roleid: json["roleid"],
    status: json["status"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    code: json["code"],
    branchid: json["branchid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "profilepic": profilepic,
    "isVerified": isVerified,
    "isActive": isActive,
    "roleid": roleid,
    "status": status,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "code": code,
    "branchid": branchid,
  };
}
