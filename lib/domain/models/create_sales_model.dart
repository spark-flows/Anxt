import 'dart:convert';

CreateSalesModel createSalesModelFromJson(String str) => CreateSalesModel.fromJson(json.decode(str));

String createSalesModelToJson(CreateSalesModel data) => json.encode(data.toJson());

// class CreateSalesModel {
//   String message;
//   CreateSalesData data;
//   int status;
//   bool isSuccess;
//
//   CreateSalesModel({required this.message, required this.data, required this.status, required this.isSuccess});
//
//   factory CreateSalesModel.fromJson(Map<String, dynamic> json) => CreateSalesModel(
//     message: json["Message"],
//     data: CreateSalesData.fromJson(json["Data"]),
//     status: json["Status"],
//     isSuccess: json["IsSuccess"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Message": message,
//     "Data": data.toJson(),
//     "Status": status,
//     "IsSuccess": isSuccess,
//   };
// }
//
// class CreateSalesData {
//   String? salespersonid;
//   List<CreateSalesProduct>? product;
//   String? customerid;
//   String? storein;
//   DateTime? nextdate;
//   List<CreateSalesAttempt>? attempt;
//   String? status;
//   String? pilistatus;
//   int? weight;
//   String? storeout;
//   String? duration;
//   String? customerneeds;
//   DateTime? nextpurchase;
//   String? customerreason;
//   String? customerfeedback;
//   String? customercategory;
//   bool? isDeleted;
//   String? deletedBy;
//   String? createdBy;
//   String? updatedBy;
//   String? id;
//   List<dynamic>? coordinateperson;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? dataId;
//
//   CreateSalesData({
//     this.salespersonid,
//     this.product,
//     this.customerid,
//     this.storein,
//     this.nextdate,
//     this.attempt,
//     this.status,
//     this.pilistatus,
//     this.weight,
//     this.storeout,
//     this.duration,
//     this.customerneeds,
//     this.nextpurchase,
//     this.customerreason,
//     this.customerfeedback,
//     this.customercategory,
//     this.isDeleted,
//     this.deletedBy,
//     this.createdBy,
//     this.updatedBy,
//     this.id,
//     this.coordinateperson,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.dataId,
//   });
//
//   factory CreateSalesData.fromJson(Map<String, dynamic> json) => CreateSalesData(
//     salespersonid: json["salespersonid"] ?? '',
//     product:
//         json["product"] == null
//             ? []
//             : List<CreateSalesProduct>.from(json["product"].map((x) => CreateSalesProduct.fromJson(x))),
//     customerid: json["customerid"] ?? "",
//     storein: json["storein"] ?? "",
//     nextdate: json["nextdate"] == null ? null : DateTime.parse(json["nextdate"]),
//     attempt: List<CreateSalesAttempt>.from(json["attempt"].map((x) => CreateSalesAttempt.fromJson(x))),
//     status: json["status"],
//     pilistatus: json["pilistatus"],
//     weight: json["weight"],
//     storeout: json["storeout"],
//     duration: json["duration"],
//     customerneeds: json["customerneeds"],
//     nextpurchase: DateTime.parse(json["nextpurchase"]),
//     customerreason: json["customerreason"],
//     customerfeedback: json["customerfeedback"],
//     customercategory: json["customercategory"],
//     isDeleted: json["isDeleted"],
//     deletedBy: json["deletedBy"],
//     createdBy: json["createdBy"],
//     updatedBy: json["updatedBy"],
//     id: json["_id"],
//     coordinateperson: List<dynamic>.from(json["coordinateperson"].map((x) => x)),
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     dataId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "salespersonid": salespersonid,
//     "product": List<dynamic>.from(product.map((x) => x.toJson())),
//     "customerid": customerid,
//     "storein": storein,
//     "nextdate": nextdate?.toIso8601String(),
//     "attempt": List<dynamic>.from(attempt.map((x) => x.toJson())),
//     "status": status,
//     "pilistatus": pilistatus,
//     "weight": weight,
//     "storeout": storeout,
//     "duration": duration,
//     "customerneeds": customerneeds,
//     "nextpurchase": nextpurchase.toIso8601String(),
//     "customerreason": customerreason,
//     "customerfeedback": customerfeedback,
//     "customercategory": customercategory,
//     "isDeleted": isDeleted,
//     "deletedBy": deletedBy,
//     "createdBy": createdBy,
//     "updatedBy": updatedBy,
//     "_id": id,
//     "coordinateperson": List<dynamic>.from(coordinateperson.map((x) => x)),
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//     "id": dataId,
//   };
// }
//
// class CreateSalesAttempt {
//   int count;
//   DateTime date;
//   String id;
//   String attemptId;
//
//   CreateSalesAttempt({required this.count, required this.date, required this.id, required this.attemptId});
//
//   factory CreateSalesAttempt.fromJson(Map<String, dynamic> json) => CreateSalesAttempt(
//     count: json["count"],
//     date: DateTime.parse(json["date"]),
//     id: json["_id"],
//     attemptId: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {"count": count, "date": date.toIso8601String(), "_id": id, "id": attemptId};
// }
//
// class CreateSalesProduct {
//   String productid;
//   int weight;
//   String id;
//   String productId;
//
//   CreateSalesProduct({required this.productid, required this.weight, required this.id, required this.productId});
//
//   factory CreateSalesProduct.fromJson(Map<String, dynamic> json) =>
//       CreateSalesProduct(productid: json["productid"], weight: json["weight"], id: json["_id"], productId: json["id"]);
//
//   Map<String, dynamic> toJson() => {"productid": productid, "weight": weight, "_id": id, "id": productId};
// }

class CreateSalesModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  CreateSalesModel({this.message, this.data, this.status, this.isSuccess});

  CreateSalesModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    status = json['Status'];
    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Status'] = this.status;
    data['IsSuccess'] = this.isSuccess;
    return data;
  }
}

class Data {
  String? salespersonid;
  List<Product>? product;
  String? customerid;
  String? storein;
  String? nextdate;
  List<Attempt>? attempt;
  String? status;
  String? pilistatus;
  int? weight;
  String? storeout;
  String? duration;
  String? customerneeds;
  String? nextpurchase;
  String? customerreason;
  String? customerfeedback;
  String? customercategory;
  List<CoordinatePersonModel>? coordinateperson;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Data(
      {this.salespersonid,
        this.product,
        this.customerid,
        this.storein,
        this.nextdate,
        this.attempt,
        this.status,
        this.pilistatus,
        this.weight,
        this.storeout,
        this.duration,
        this.customerneeds,
        this.nextpurchase,
        this.customerreason,
        this.customerfeedback,
        this.customercategory,
        this.coordinateperson,
        this.isDeleted,
        this.deletedBy,
        this.createdBy,
        this.updatedBy,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    salespersonid = json['salespersonid'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    customerid = json['customerid'];
    storein = json['storein'];
    nextdate = json['nextdate'];
    if (json['attempt'] != null) {
      attempt = <Attempt>[];
      json['attempt'].forEach((v) {
        attempt!.add(new Attempt.fromJson(v));
      });
    }
    status = json['status'];
    pilistatus = json['pilistatus'];
    weight = json['weight'];
    storeout = json['storeout'];
    duration = json['duration'];
    customerneeds = json['customerneeds'];
    nextpurchase = json['nextpurchase'];
    customerreason = json['customerreason'];
    customerfeedback = json['customerfeedback'];
    customercategory = json['customercategory'];
    if (json['coordinateperson'] != null) {
      coordinateperson = <CoordinatePersonModel>[];
      json['coordinateperson'].forEach((v) {
        coordinateperson!.add(CoordinatePersonModel.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
    deletedBy = json['deletedBy'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salespersonid'] = this.salespersonid;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['customerid'] = this.customerid;
    data['storein'] = this.storein;
    data['nextdate'] = this.nextdate;
    if (this.attempt != null) {
      data['attempt'] = this.attempt!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['pilistatus'] = this.pilistatus;
    data['weight'] = this.weight;
    data['storeout'] = this.storeout;
    data['duration'] = this.duration;
    data['customerneeds'] = this.customerneeds;
    data['nextpurchase'] = this.nextpurchase;
    data['customerreason'] = this.customerreason;
    data['customerfeedback'] = this.customerfeedback;
    data['customercategory'] = this.customercategory;
    if (this.coordinateperson != null) {
      data['coordinateperson'] =
          this.coordinateperson!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = isDeleted;
    data['deletedBy'] = deletedBy;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

class Product {
  String? productid;
  int? weight;
  String? sId;
  String? id;

  Product({this.productid, this.weight, this.sId, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    weight = json['weight'];
    sId = json['_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = this.productid;
    data['weight'] = this.weight;
    data['_id'] = this.sId;
    data['id'] = this.id;
    return data;
  }
}

class Attempt {
  int? count;
  String? date;
  String? sId;
  String? id;

  Attempt({this.count, this.date, this.sId, this.id});

  Attempt.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    date = json['date'];
    sId = json['_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = this.count;
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['id'] = this.id;
    return data;
  }
}

class CoordinatePersonModel {
  String? name;
  String? sId;

  CoordinatePersonModel({ this.sId, this.name});

  CoordinatePersonModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    return data;
  }
}
