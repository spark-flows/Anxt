// To parse this JSON data, do
//
//     final customerListModel = customerListModelFromJson(jsonString);

import 'dart:convert';

CustomerListModel customerListModelFromJson(String str) =>
    CustomerListModel.fromJson(json.decode(str));

String customerListModelToJson(CustomerListModel data) =>
    json.encode(data.toJson());

class CustomerListModel {
  String? message;
  List<CustomerListData>? data;
  int? status;
  bool? isSuccess;

  CustomerListModel({this.message, this.data, this.status, this.isSuccess});

  factory CustomerListModel.fromJson(Map<String, dynamic> json) =>
      CustomerListModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? []
                : List<CustomerListData>.from(
                  json["Data"]!.map((x) => CustomerListData.fromJson(x)),
                ),
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

class CustomerListData {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? state;
  String? city;
  String? area;
  String? zipcode;
  String? assignby;
  String? ownername;
  String? ownermobile;
  String? managername;
  String? managermobile;
  String? refinside;
  String? refoutside;
  String? custcategory;
  String? status;
  bool? isDeleted;
  dynamic deletedBy;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  String? salesperson;
  String? remark1;
  String? remark2;
  bool checkbox;

  CustomerListData({
    this.id,
    this.name,
    this.checkbox = false,
    this.email,
    this.mobile,
    this.address,
    this.state,
    this.city,
    this.area,
    this.zipcode,
    this.assignby,
    this.ownername,
    this.ownermobile,
    this.managername,
    this.managermobile,
    this.refinside,
    this.refoutside,
    this.custcategory,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.salesperson,
    this.remark1,
    this.remark2,
  });

  factory CustomerListData.fromJson(Map<String, dynamic> json) =>
      CustomerListData(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        area: json["area"],
        zipcode: json["zipcode"],
        assignby: json["assignby"],
        ownername: json["ownername"],
        ownermobile: json["ownermobile"],
        managername: json["managername"],
        managermobile: json["managermobile"],
        refinside: json["refinside"],
        refoutside: json["refoutside"],
        custcategory: json["custcategory"],
        status: json["status"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        salesperson: json["salesperson"],
        remark1: json["remark1"],
        remark2: json["remark2"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "state": state,
    "city": city,
    "area": area,
    "zipcode": zipcode,
    "assignby": assignby,
    "ownername": ownername,
    "ownermobile": ownermobile,
    "managername": managername,
    "managermobile": managermobile,
    "refinside": refinside,
    "refoutside": refoutside,
    "custcategory": custcategory,
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "salesperson": salesperson,
    "remark1": remark1,
    "remark2": remark2,
  };
}
