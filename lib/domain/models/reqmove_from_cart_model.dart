// To parse this JSON data, do
//
//     final removeFromCartModel = removeFromCartModelFromJson(jsonString);

import 'dart:convert';

RemoveFromCartModel removeFromCartModelFromJson(String str) =>
    RemoveFromCartModel.fromJson(json.decode(str));

String removeFromCartModelToJson(RemoveFromCartModel data) =>
    json.encode(data.toJson());

class RemoveFromCartModel {
  String? message;
  RemoveFromCartData? data;
  int? status;
  bool? isSuccess;

  RemoveFromCartModel({this.message, this.data, this.status, this.isSuccess});

  factory RemoveFromCartModel.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : RemoveFromCartData.fromJson(json["Data"]),
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

class RemoveFromCartData {
  String? id;
  RemoveFromCartCustomerid? customerid;
  RemoveFromCartSales? salesmanid;
  RemoveFromCartSales? salesexecutiveid;
  String? salesid;
  String? huid;
  List<RemoveFromCartItem>? items;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  String? userid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  RemoveFromCartSummary? summary;

  RemoveFromCartData({
    this.id,
    this.customerid,
    this.salesmanid,
    this.salesexecutiveid,
    this.salesid,
    this.huid,
    this.items,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.userid,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.summary,
  });

  factory RemoveFromCartData.fromJson(
    Map<String, dynamic> json,
  ) => RemoveFromCartData(
    id: json["_id"],
    customerid:
        json["customerid"] == null
            ? null
            : RemoveFromCartCustomerid.fromJson(json["customerid"]),
    salesmanid:
        json["salesmanid"] == null
            ? null
            : RemoveFromCartSales.fromJson(json["salesmanid"]),
    salesexecutiveid:
        json["salesexecutiveid"] == null
            ? null
            : RemoveFromCartSales.fromJson(json["salesexecutiveid"]),
    salesid: json["salesid"],
    huid: json["huid"],
    items:
        json["items"] == null
            ? []
            : List<RemoveFromCartItem>.from(
              json["items"]!.map((x) => RemoveFromCartItem.fromJson(x)),
            ),
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    userid: json["userid"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    summary:
        json["summary"] == null
            ? null
            : RemoveFromCartSummary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "customerid": customerid?.toJson(),
    "salesmanid": salesmanid?.toJson(),
    "salesexecutiveid": salesexecutiveid?.toJson(),
    "salesid": salesid,
    "huid": huid,
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "userid": userid,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "summary": summary?.toJson(),
  };
}

class RemoveFromCartCustomerid {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? address;

  RemoveFromCartCustomerid({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
  });

  factory RemoveFromCartCustomerid.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartCustomerid(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
  };
}

class RemoveFromCartItem {
  String? jobno;
  String? designno;
  String? image;
  String? pricemasternameid;
  String? makingrate;
  String? stonerate;
  int? quantity;
  String? huid;
  String? id;
  String? category;
  String? subcategory;
  RemoveFromCartCalculation? calculation;

  RemoveFromCartItem({
    this.jobno,
    this.designno,
    this.image,
    this.pricemasternameid,
    this.makingrate,
    this.stonerate,
    this.quantity,
    this.huid,
    this.id,
    this.category,
    this.subcategory,
    this.calculation,
  });

  factory RemoveFromCartItem.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartItem(
        jobno: json["jobno"],
        designno: json["designno"],
        image: json["image"],
        pricemasternameid: json["pricemasternameid"],
        makingrate: json["makingrate"],
        stonerate: json["stonerate"],
        quantity: json["quantity"],
        huid: json["huid"],
        id: json["_id"],
        category: json["category"],
        subcategory: json["subcategory"],
        calculation:
            json["calculation"] == null
                ? null
                : RemoveFromCartCalculation.fromJson(json["calculation"]),
      );

  Map<String, dynamic> toJson() => {
    "jobno": jobno,
    "designno": designno,
    "image": image,
    "pricemasternameid": pricemasternameid,
    "makingrate": makingrate,
    "stonerate": stonerate,
    "quantity": quantity,
    "huid": huid,
    "_id": id,
    "category": category,
    "subcategory": subcategory,
    "calculation": calculation?.toJson(),
  };
}

class RemoveFromCartCalculation {
  List<RemoveFromCartComponent>? components;
  RemoveFromCartSummary? summary;

  RemoveFromCartCalculation({this.components, this.summary});

  factory RemoveFromCartCalculation.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartCalculation(
        components:
            json["components"] == null
                ? []
                : List<RemoveFromCartComponent>.from(
                  json["components"]!.map(
                    (x) => RemoveFromCartComponent.fromJson(x),
                  ),
                ),
        summary:
            json["summary"] == null
                ? null
                : RemoveFromCartSummary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
    "components":
        components == null
            ? []
            : List<dynamic>.from(components!.map((x) => x.toJson())),
    "summary": summary?.toJson(),
  };
}

class RemoveFromCartComponent {
  String? material;
  String? quality;
  double? purity;
  String? grosswt;
  String? netwt;
  double? fine;
  int? rate;
  double? amount;
  String? shape;
  String? color;
  String? size;
  int? pcs;
  double? weight;
  String? number;

  RemoveFromCartComponent({
    this.material,
    this.quality,
    this.purity,
    this.grosswt,
    this.netwt,
    this.fine,
    this.rate,
    this.amount,
    this.shape,
    this.color,
    this.size,
    this.pcs,
    this.weight,
    this.number,
  });

  factory RemoveFromCartComponent.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartComponent(
        material: json["material"],
        quality: json["quality"],
        purity: json["purity"]?.toDouble(),
        grosswt: json["grosswt"],
        netwt: json["netwt"],
        fine: json["fine"]?.toDouble(),
        rate: json["rate"],
        amount: json["amount"]?.toDouble(),
        shape: json["shape"],
        color: json["color"],
        size: json["size"],
        pcs: json["pcs"],
        weight: json["weight"]?.toDouble(),
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
    "material": material,
    "quality": quality,
    "purity": purity,
    "grosswt": grosswt,
    "netwt": netwt,
    "fine": fine,
    "rate": rate,
    "amount": amount,
    "shape": shape,
    "color": color,
    "size": size,
    "pcs": pcs,
    "weight": weight,
    "number": number,
  };
}

class RemoveFromCartSummary {
  int? quantity;
  String? grossweight;
  String? netweight;
  String? fineweight;
  String? metalamount;
  String? diamondcts;
  int? diamondpcs;
  String? diamondamount;
  String? stoneweight;
  String? stoneamount;
  String? makingcharges;
  String? huidNumber;
  String? huidcharges;
  String? totalamount;
  int? gstpercent;
  String? gstamount;
  String? finalamount;
  String? subtotal;
  int? totalQuantity;
  String? huidTotal;

  RemoveFromCartSummary({
    this.quantity,
    this.grossweight,
    this.netweight,
    this.fineweight,
    this.metalamount,
    this.diamondcts,
    this.diamondpcs,
    this.diamondamount,
    this.stoneweight,
    this.stoneamount,
    this.makingcharges,
    this.huidNumber,
    this.huidcharges,
    this.totalamount,
    this.gstpercent,
    this.gstamount,
    this.finalamount,
    this.subtotal,
    this.totalQuantity,
    this.huidTotal,
  });

  factory RemoveFromCartSummary.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartSummary(
        quantity: json["quantity"],
        grossweight: json["grossweight"],
        netweight: json["netweight"],
        fineweight: json["fineweight"],
        metalamount: json["metalamount"],
        diamondcts: json["diamondcts"],
        diamondpcs: json["diamondpcs"],
        diamondamount: json["diamondamount"],
        stoneweight: json["stoneweight"],
        stoneamount: json["stoneamount"],
        makingcharges: json["makingcharges"],
        huidNumber: json["huidNumber"],
        huidcharges: json["huidcharges"],
        totalamount: json["totalamount"],
        gstpercent: json["gstpercent"],
        gstamount: json["gstamount"],
        finalamount: json["finalamount"],
        subtotal: json["subtotal"],
        totalQuantity: json["totalQuantity"],
        huidTotal: json["huidTotal"],
      );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "grossweight": grossweight,
    "netweight": netweight,
    "fineweight": fineweight,
    "metalamount": metalamount,
    "diamondcts": diamondcts,
    "diamondpcs": diamondpcs,
    "diamondamount": diamondamount,
    "stoneweight": stoneweight,
    "stoneamount": stoneamount,
    "makingcharges": makingcharges,
    "huidNumber": huidNumber,
    "huidcharges": huidcharges,
    "totalamount": totalamount,
    "gstpercent": gstpercent,
    "gstamount": gstamount,
    "finalamount": finalamount,
    "subtotal": subtotal,
    "totalQuantity": totalQuantity,
    "huidTotal": huidTotal,
  };
}

class RemoveFromCartSales {
  String? id;
  String? name;

  RemoveFromCartSales({this.id, this.name});

  factory RemoveFromCartSales.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartSales(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
