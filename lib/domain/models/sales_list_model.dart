// To parse this JSON data, do
//
//     final salesListModel = salesListModelFromJson(jsonString);

import 'dart:convert';

SalesListModel salesListModelFromJson(String str) =>
    SalesListModel.fromJson(json.decode(str));

String salesListModelToJson(SalesListModel data) => json.encode(data.toJson());

class SalesListModel {
  String? message;
  SalesListData? data;
  int? status;
  bool? isSuccess;

  SalesListModel({this.message, this.data, this.status, this.isSuccess});

  factory SalesListModel.fromJson(Map<String, dynamic> json) => SalesListModel(
    message: json["Message"],
    data: json["Data"] == null ? null : SalesListData.fromJson(json["Data"]),
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

class SalesListData {
  List<SalesListDoc>? docs;
  int? totalDocs;
  int? totalWeight;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  SalesListData({
    this.docs,
    this.totalDocs,
    this.totalWeight,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory SalesListData.fromJson(Map<String, dynamic> json) => SalesListData(
    docs:
        json["docs"] == null
            ? []
            : List<SalesListDoc>.from(
              json["docs"]!.map((x) => SalesListDoc.fromJson(x)),
            ),
    totalDocs: json["totalDocs"],
    totalWeight: json["totalWeight"],
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
    "totalWeight": totalWeight,
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

class SalesListDoc {
  String? id;
  Salesperson? salesperson;
  List<Product>? products;
  Customer? customer;
  String? storein;
  num? attempt;
  dynamic nextdate;
  String? status;
  String? pilistatus;
  num? weight;
  String? storeout;
  String? customerneeds;
  dynamic nextpurchase;
  String? customerreason;
  String? customerfeedback;
  dynamic storeaddress;
  String? createdAt;
  String? duration;
  num? goldweight;
  num? diamondweight;
  String? location;
  List<dynamic>? coordinateperson;
  dynamic cartInfo;
  bool? isCart;

  SalesListDoc({
    this.id,
    this.salesperson,
    this.products,
    this.customer,
    this.storein,
    this.attempt,
    this.nextdate,
    this.status,
    this.pilistatus,
    this.weight,
    this.storeout,
    this.customerneeds,
    this.nextpurchase,
    this.customerreason,
    this.customerfeedback,
    this.storeaddress,
    this.createdAt,
    this.duration,
    this.goldweight,
    this.diamondweight,
    this.location,
    this.coordinateperson,
    this.cartInfo,
    this.isCart,
  });

  factory SalesListDoc.fromJson(Map<String, dynamic> json) => SalesListDoc(
    id: json["_id"],
    salesperson:
        json["salesperson"] == null
            ? null
            : Salesperson.fromJson(json["salesperson"]),
    products:
        json["products"] == null
            ? []
            : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x)),
            ),
    customer:
        json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    storein: json["storein"],
    attempt: json["attempt"],
    nextdate: json["nextdate"],
    status: json["status"],
    pilistatus: json["pilistatus"],
    weight: json["weight"],
    storeout: json["storeout"],
    customerneeds: json["customerneeds"],
    nextpurchase: json["nextpurchase"],
    customerreason: json["customerreason"],
    customerfeedback: json["customerfeedback"],
    storeaddress: json["storeaddress"],
    createdAt: json["createdAt"],
    duration: json["duration"],
    goldweight: json["goldweight"],
    diamondweight: json["diamondweight"],
    location: json["location"],
    coordinateperson:
        json["coordinateperson"] == null
            ? []
            : List<dynamic>.from(json["coordinateperson"]!.map((x) => x)),
    cartInfo: json["cartInfo"],
    isCart: json["isCart"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "salesperson": salesperson?.toJson(),
    "products":
        products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
    "customer": customer?.toJson(),
    "storein": storein,
    "attempt": attempt,
    "nextdate": nextdate,
    "status": status,
    "pilistatus": pilistatus,
    "weight": weight,
    "storeout": storeout,
    "customerneeds": customerneeds,
    "nextpurchase": nextpurchase,
    "customerreason": customerreason,
    "customerfeedback": customerfeedback,
    "storeaddress": storeaddress,
    "createdAt": createdAt,
    "duration": duration,
    "goldweight": goldweight,
    "diamondweight": diamondweight,
    "location": location,
    "coordinateperson":
        coordinateperson == null
            ? []
            : List<dynamic>.from(coordinateperson!.map((x) => x)),
    "cartInfo": cartInfo,
    "isCart": isCart,
  };
}

class Customer {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? custcategory;

  Customer({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.custcategory,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    custcategory: json["custcategory"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "custcategory": custcategory,
  };
}

class Product {
  Productid? productid;

  Product({this.productid});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productid:
        json["productid"] == null
            ? null
            : Productid.fromJson(json["productid"]),
  );

  Map<String, dynamic> toJson() => {"productid": productid?.toJson()};
}

class Productid {
  Productid();

  factory Productid.fromJson(Map<String, dynamic> json) => Productid();

  Map<String, dynamic> toJson() => {};
}

class Salesperson {
  String? id;
  String? name;

  Salesperson({this.id, this.name});

  factory Salesperson.fromJson(Map<String, dynamic> json) =>
      Salesperson(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
