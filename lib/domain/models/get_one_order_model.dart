// To parse this JSON data, do
//
//     final getOneOrderModel = getOneOrderModelFromJson(jsonString);

import 'dart:convert';

GetOneOrderModel getOneOrderModelFromJson(String str) =>
    GetOneOrderModel.fromJson(json.decode(str));

String getOneOrderModelToJson(GetOneOrderModel data) =>
    json.encode(data.toJson());

class GetOneOrderModel {
  String? message;
  GetOneOrderData? data;
  num? status;
  bool? isSuccess;

  GetOneOrderModel({this.message, this.data, this.status, this.isSuccess});

  factory GetOneOrderModel.fromJson(
    Map<String, dynamic> json,
  ) => GetOneOrderModel(
    message: json["Message"],
    data: json["Data"] == null ? null : GetOneOrderData.fromJson(json["Data"]),
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

class GetOneOrderData {
  String? id;
  String? orderno;
  GetOneOrderSalesexecutiveid? salesexecutiveid;
  GetOneOrderCustomerid? customerid;
  String? discount;
  String? discounttype;
  GetOneOrderSummary? summary;
  List<GetOneOrderItem>? items;
  String? status;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  GetOneOrderData({
    this.id,
    this.orderno,
    this.salesexecutiveid,
    this.customerid,
    this.discount,
    this.discounttype,
    this.summary,
    this.items,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetOneOrderData.fromJson(
    Map<String, dynamic> json,
  ) => GetOneOrderData(
    id: json["_id"],
    orderno: json["orderno"],
    salesexecutiveid:
        json["salesexecutiveid"] == null
            ? null
            : GetOneOrderSalesexecutiveid.fromJson(json["salesexecutiveid"]),
    customerid:
        json["customerid"] == null
            ? null
            : GetOneOrderCustomerid.fromJson(json["customerid"]),
    discount: json["discount"],
    discounttype: json["discounttype"],
    summary:
        json["summary"] == null
            ? null
            : GetOneOrderSummary.fromJson(json["summary"]),
    items:
        json["items"] == null
            ? []
            : List<GetOneOrderItem>.from(
              json["items"]!.map((x) => GetOneOrderItem.fromJson(x)),
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
    "orderno": orderno,
    "salesexecutiveid": salesexecutiveid?.toJson(),
    "customerid": customerid?.toJson(),
    "discount": discount,
    "discounttype": discounttype,
    "summary": summary?.toJson(),
    "items":
        items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
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

class GetOneOrderCustomerid {
  String? id;
  String? name;
  String? email;
  String? address;

  GetOneOrderCustomerid({this.id, this.name, this.email, this.address});

  factory GetOneOrderCustomerid.fromJson(Map<String, dynamic> json) =>
      GetOneOrderCustomerid(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "address": address,
  };
}

class GetOneOrderItem {
  String? grossweight;
  String? netweight;
  String? fineweight;
  String? diamondcts;
  String? diamondpcs;
  String? stoneweight;
  String? stoneamount;
  String? makingcharges;
  String? huidcharges;
  num? gstpercent;
  String? totalamount;
  String? finalamount;
  String? id;
  String? jobno;
  String? designno;
  String? pricemasternameid;
  String? makingrate;
  String? stonerate;
  num? quantity;
  String? metalQuality;
  String? image;
  String? huid;
  dynamic diamondamount;
  List<GetOneOrderComponent>? components;
  String? itemTotal;

  GetOneOrderItem({
    this.grossweight,
    this.netweight,
    this.fineweight,
    this.diamondcts,
    this.diamondpcs,
    this.metalQuality,
    this.stoneweight,
    this.stoneamount,
    this.makingcharges,
    this.huidcharges,
    this.gstpercent,
    this.totalamount,
    this.finalamount,
    this.image,
    this.id,
    this.jobno,
    this.designno,
    this.pricemasternameid,
    this.makingrate,
    this.stonerate,
    this.quantity,
    this.huid,
    this.diamondamount,
    this.components,
    this.itemTotal,
  });

  factory GetOneOrderItem.fromJson(Map<String, dynamic> json) =>
      GetOneOrderItem(
        grossweight: json["grossweight"],
        netweight: json["netweight"],
        fineweight: json["fineweight"],
        diamondcts: json["diamondcts"],
        diamondpcs: json["diamondpcs"],
        stoneweight: json["stoneweight"],
        stoneamount: json["stoneamount"],
        makingcharges: json["makingcharges"],
        huidcharges: json["huidcharges"],
        gstpercent: json["gstpercent"],
        totalamount: json["totalamount"],
        finalamount: json["finalamount"],
        id: json["_id"],
        image: json['image'] ?? "",
        metalQuality: json['metalQuality'] ?? "",
        jobno: json["jobno"],
        designno: json["designno"],
        pricemasternameid: json["pricemasternameid"],
        makingrate: json["makingrate"],
        stonerate: json["stonerate"],
        quantity: json["quantity"],
        huid: json["huid"],
        diamondamount: json["diamondamount"],
        components:
            json["components"] == null
                ? []
                : List<GetOneOrderComponent>.from(
                  json["components"]!.map(
                    (x) => GetOneOrderComponent.fromJson(x),
                  ),
                ),
        itemTotal: json["itemTotal"],
      );

  Map<String, dynamic> toJson() => {
    "grossweight": grossweight,
    "netweight": netweight,
    "fineweight": fineweight,
    "diamondcts": diamondcts,
    "diamondpcs": diamondpcs,
    "stoneweight": stoneweight,
    "stoneamount": stoneamount,
    "makingcharges": makingcharges,
    "huidcharges": huidcharges,
    "gstpercent": gstpercent,
    "totalamount": totalamount,
    "finalamount": finalamount,
    "_id": id,
    "jobno": jobno,
    "designno": designno,
    "pricemasternameid": pricemasternameid,
    "makingrate": makingrate,
    "stonerate": stonerate,
    "quantity": quantity,
    "huid": huid,
    "diamondamount": diamondamount,
    "components":
        components == null
            ? []
            : List<dynamic>.from(components!.map((x) => x.toJson())),
    "itemTotal": itemTotal,
  };
}

class GetOneOrderComponent {
  String? material;
  double? purity;
  String? grosswt;
  String? netwt;
  dynamic fine;
  dynamic rate;
  num? amount;
  String? shape;
  String? quality;
  String? color;
  String? size;
  num? pcs;
  double? weight;
  String? makingtype;

  GetOneOrderComponent({
    this.material,
    this.purity,
    this.grosswt,
    this.netwt,
    this.fine,
    this.rate,
    this.amount,
    this.shape,
    this.quality,
    this.color,
    this.size,
    this.pcs,
    this.weight,
    this.makingtype,
  });

  factory GetOneOrderComponent.fromJson(Map<String, dynamic> json) =>
      GetOneOrderComponent(
        material: json["material"],
        purity: json["purity"]?.toDouble(),
        grosswt: json["grosswt"],
        netwt: json["netwt"],
        fine: json["fine"],
        rate: json["rate"],
        amount: json["amount"],
        shape: json["shape"],
        quality: json["quality"],
        color: json["color"],
        size: json["size"],
        pcs: json["pcs"],
        weight: json["weight"]?.toDouble(),
        makingtype: json["makingtype"],
      );

  Map<String, dynamic> toJson() => {
    "material": material,
    "purity": purity,
    "grosswt": grosswt,
    "netwt": netwt,
    "fine": fine,
    "rate": rate,
    "amount": amount,
    "shape": shape,
    "quality": quality,
    "color": color,
    "size": size,
    "pcs": pcs,
    "weight": weight,
    "makingtype": makingtype,
  };
}

class GetOneOrderSalesexecutiveid {
  String? id;
  String? name;

  GetOneOrderSalesexecutiveid({this.id, this.name});

  factory GetOneOrderSalesexecutiveid.fromJson(Map<String, dynamic> json) =>
      GetOneOrderSalesexecutiveid(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}

class GetOneOrderSummary {
  num? quantity;
  String? totalamount;
  double? gstamount;
  String? taxable;
  String? discountamount;
  num? gstpercent;
  String? finalamount;
  num? huidcharges;
  String? grossweight;
  String? netweight;
  String? fineweight;
  String? diamondcts;
  num? diamondpcs;
  String? stoneweight;
  String? stoneamount;
  String? makingcharges;
  String? diamondamount;

  GetOneOrderSummary({
    this.quantity,
    this.totalamount,
    this.gstamount,
    this.taxable,
    this.discountamount,
    this.gstpercent,
    this.finalamount,
    this.huidcharges,
    this.grossweight,
    this.netweight,
    this.fineweight,
    this.diamondcts,
    this.diamondpcs,
    this.stoneweight,
    this.stoneamount,
    this.makingcharges,
    this.diamondamount,
  });

  factory GetOneOrderSummary.fromJson(Map<String, dynamic> json) =>
      GetOneOrderSummary(
        quantity: json["quantity"],
        totalamount: json["totalamount"],
        gstamount: json["gstamount"]?.toDouble(),
        taxable: json["taxable"],
        discountamount: json["discountamount"],
        gstpercent: json["gstpercent"],
        finalamount: json["finalamount"],
        huidcharges: json["huidcharges"],
        grossweight: json["grossweight"],
        netweight: json["netweight"],
        fineweight: json["fineweight"],
        diamondcts: json["diamondcts"],
        diamondpcs: json["diamondpcs"],
        stoneweight: json["stoneweight"],
        stoneamount: json["stoneamount"],
        makingcharges: json["makingcharges"],
        diamondamount: json["diamondamount"],
      );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "totalamount": totalamount,
    "gstamount": gstamount,
    "taxable": taxable,
    "discountamount": discountamount,
    "gstpercent": gstpercent,
    "finalamount": finalamount,
    "huidcharges": huidcharges,
    "grossweight": grossweight,
    "netweight": netweight,
    "fineweight": fineweight,
    "diamondcts": diamondcts,
    "diamondpcs": diamondpcs,
    "stoneweight": stoneweight,
    "stoneamount": stoneamount,
    "makingcharges": makingcharges,
    "diamondamount": diamondamount,
  };
}
