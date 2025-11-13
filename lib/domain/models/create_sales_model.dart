import 'dart:convert';

CreateSalesModel createSalesModelFromJson(String str) =>
    CreateSalesModel.fromJson(json.decode(str));

String createSalesModelToJson(CreateSalesModel data) =>
    json.encode(data.toJson());

class CreateSalesModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  CreateSalesModel({this.message, this.data, this.status, this.isSuccess});

  CreateSalesModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    status = json['Status'];
    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Status'] = status;
    data['IsSuccess'] = isSuccess;
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
  num? weight; // changed to num
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

  Data({
    this.salespersonid,
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
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    salespersonid = json['salespersonid']?.toString() ?? '';
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    customerid = json['customerid']?.toString() ?? '';
    storein = json['storein']?.toString() ?? '';
    nextdate = json['nextdate']?.toString() ?? '';

    if (json['attempt'] != null) {
      attempt = <Attempt>[];
      json['attempt'].forEach((v) {
        attempt!.add(Attempt.fromJson(v));
      });
    }

    status = json['status']?.toString() ?? '';
    pilistatus = json['pilistatus']?.toString() ?? '';

    // Allow int or double
    weight = json['weight'] is num
        ? json['weight']
        : num.tryParse(json['weight']?.toString() ?? '0') ?? 0;

    storeout = json['storeout']?.toString() ?? '';
    duration = json['duration']?.toString() ?? '';
    customerneeds = json['customerneeds']?.toString() ?? '';
    nextpurchase = json['nextpurchase']?.toString() ?? '';
    customerreason = json['customerreason']?.toString() ?? '';
    customerfeedback = json['customerfeedback']?.toString() ?? '';
    customercategory = json['customercategory']?.toString() ?? '';

    if (json['coordinateperson'] != null) {
      coordinateperson = <CoordinatePersonModel>[];
      json['coordinateperson'].forEach((v) {
        coordinateperson!.add(CoordinatePersonModel.fromJson(v));
      });
    }

    isDeleted = json['isDeleted'] ?? false;
    deletedBy = json['deletedBy']?.toString() ?? '';

    // Safe for object or string values
    createdBy = (json['createdBy'] is Map)
        ? json['createdBy']['_id']?.toString() ?? ''
        : json['createdBy']?.toString() ?? '';

    updatedBy = (json['updatedBy'] is Map)
        ? json['updatedBy']['_id']?.toString() ?? ''
        : json['updatedBy']?.toString() ?? '';

    sId = json['_id']?.toString() ?? '';
    createdAt = json['createdAt']?.toString() ?? '';
    updatedAt = json['updatedAt']?.toString() ?? '';
    iV = json['__v'] is int
        ? json['__v']
        : int.tryParse(json['__v']?.toString() ?? '0');
    id = json['id']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salespersonid'] = salespersonid;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    data['customerid'] = customerid;
    data['storein'] = storein;
    data['nextdate'] = nextdate;
    if (attempt != null) {
      data['attempt'] = attempt!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['pilistatus'] = pilistatus;
    data['weight'] = weight;
    data['storeout'] = storeout;
    data['duration'] = duration;
    data['customerneeds'] = customerneeds;
    data['nextpurchase'] = nextpurchase;
    data['customerreason'] = customerreason;
    data['customerfeedback'] = customerfeedback;
    data['customercategory'] = customercategory;
    if (coordinateperson != null) {
      data['coordinateperson'] =
          coordinateperson!.map((v) => v.toJson()).toList();
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
  num? weight; // changed
  String? sId;
  String? id;

  Product({this.productid, this.weight, this.sId, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    productid = json['productid']?.toString() ?? '';
    weight = json['weight'] is num
        ? json['weight']
        : num.tryParse(json['weight']?.toString() ?? '0') ?? 0;
    sId = json['_id']?.toString() ?? '';
    id = json['id']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productid'] = productid;
    data['weight'] = weight;
    data['_id'] = sId;
    data['id'] = id;
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
    count = json['count'] is int
        ? json['count']
        : int.tryParse(json['count']?.toString() ?? '0');
    date = json['date']?.toString() ?? '';
    sId = json['_id']?.toString() ?? '';
    id = json['id']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['date'] = date;
    data['_id'] = sId;
    data['id'] = id;
    return data;
  }
}

class CoordinatePersonModel {
  String? name;
  String? sId;

  CoordinatePersonModel({this.sId, this.name});

  CoordinatePersonModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id']?.toString() ?? '';
    name = json['name']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
