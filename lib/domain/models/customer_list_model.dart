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
  CustomerListData? data;
  int? status;
  bool? isSuccess;

  CustomerListModel({this.message, this.data, this.status, this.isSuccess});

  factory CustomerListModel.fromJson(
    Map<String, dynamic> json,
  ) => CustomerListModel(
    message: json["Message"],
    data: json["Data"] == null ? null : CustomerListData.fromJson(json["Data"]),
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

class CustomerListData {
  List<CustomerListDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  CustomerListData({
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

  factory CustomerListData.fromJson(Map<String, dynamic> json) =>
      CustomerListData(
        docs:
            json["docs"] == null
                ? []
                : List<CustomerListDoc>.from(
                  json["docs"]!.map((x) => CustomerListDoc.fromJson(x)),
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

class CustomerListDoc {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? state;
  String? city;
  String? area;
  String? zipcode;
  Assignby? assignby;
  String? ownername;
  String? ownermobile;
  String? managername;
  String? managermobile;
  String? type;
  String? refinside;
  String? refoutside;
  String? custcategory;
  String? limits;
  String? status;
  String? createdAt;
  Assignby? salesperson;
  Remark1? remark1;
  String? remark2;
  int? attempt;
  String? salestatus;
  String? nextdate;
  bool? checkbox;

  CustomerListDoc({
    this.id,
    this.code,
    this.checkbox = false,
    this.name,
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
    this.type,
    this.refinside,
    this.refoutside,
    this.custcategory,
    this.limits,
    this.status,
    this.createdAt,
    this.salesperson,
    this.remark1,
    this.remark2,
    this.attempt,
    this.salestatus,
    this.nextdate,
  });

  factory CustomerListDoc.fromJson(
    Map<String, dynamic> json,
  ) => CustomerListDoc(
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    state: json["state"],
    city: json["city"],
    area: json["area"],
    zipcode: json["zipcode"],
    assignby:
        json["assignby"] == null ? null : Assignby.fromJson(json["assignby"]),
    ownername: json["ownername"],
    ownermobile: json["ownermobile"],
    managername: json["managername"],
    managermobile: json["managermobile"],
    type: json["type"],
    refinside: json["refinside"],
    refoutside: json["refoutside"],
    custcategory: json["custcategory"],
    limits: json["limits"],
    status: json["status"],
    createdAt: json["createdAt"],
    salesperson:
        json["salesperson"] == null
            ? null
            : Assignby.fromJson(json["salesperson"]),
    remark1: json["remark1"] == null ? null : Remark1.fromJson(json["remark1"]),
    remark2: json["remark2"],
    attempt: json["attempt"],
    salestatus: json["salestatus"],
    nextdate: json["nextdate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "code": code,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "state": state,
    "city": city,
    "area": area,
    "zipcode": zipcode,
    "assignby": assignby?.toJson(),
    "ownername": ownername,
    "ownermobile": ownermobile,
    "managername": managername,
    "managermobile": managermobile,
    "type": type,
    "refinside": refinside,
    "refoutside": refoutside,
    "custcategory": custcategory,
    "limits": limits,
    "status": status,
    "createdAt": createdAt,
    "salesperson": salesperson?.toJson(),
    "remark1": remark1?.toJson(),
    "remark2": remark2,
    "attempt": attempt,
    "salestatus": salestatus,
    "nextdate": nextdate,
  };
}

class Assignby {
  String? id;
  String? name;
  String? mobile;

  Assignby({this.id, this.name, this.mobile});

  factory Assignby.fromJson(Map<String, dynamic> json) =>
      Assignby(id: json["_id"], name: json["name"], mobile: json["mobile"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name, "mobile": mobile};
}

class Remark1 {
  String? id;
  String? name;

  Remark1({this.id, this.name});

  factory Remark1.fromJson(Map<String, dynamic> json) =>
      Remark1(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
