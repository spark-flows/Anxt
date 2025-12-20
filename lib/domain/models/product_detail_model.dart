// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  String? message;
  ProductDetailData? data;
  int? status;
  bool? isSuccess;

  ProductDetailModel({this.message, this.data, this.status, this.isSuccess});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : ProductDetailData.fromJson(json["Data"]),
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

class ProductDetailData {
  String? stockid;
  String? jobno;
  String? designno;
  String? image;
  String? huid;
  int? huidCharges;
  int? quantity;
  List<ProductDetailMetalcomponent>? metalcomponents;
  List<ProductDetailDiamondcomponent>? diamondcomponents;
  List<dynamic>? stonecomponents;
  List<ProductDetailMakingcomponent>? makingcomponents;
  List<dynamic>? huidcomponents;
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
  String? huidcharges;
  String? totalamount;
  String? gstamount;
  String? finalamount;
  Map<String, double>? labGrownDiamondRates;

  ProductDetailData({
    this.stockid,
    this.jobno,
    this.designno,
    this.image,
    this.huid,
    this.huidCharges,
    this.quantity,
    this.metalcomponents,
    this.diamondcomponents,
    this.stonecomponents,
    this.makingcomponents,
    this.huidcomponents,
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
    this.huidcharges,
    this.totalamount,
    this.gstamount,
    this.finalamount,
    this.labGrownDiamondRates,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        stockid: json["stockid"],
        jobno: json["jobno"],
        designno: json["designno"],
        image: json["image"],
        huid: json["huid"],
        huidCharges: json["huidCharges"],
        quantity: json["quantity"],
        metalcomponents:
            json["metalcomponents"] == null
                ? []
                : List<ProductDetailMetalcomponent>.from(
                  json["metalcomponents"]!.map(
                    (x) => ProductDetailMetalcomponent.fromJson(x),
                  ),
                ),
        diamondcomponents:
            json["diamondcomponents"] == null
                ? []
                : List<ProductDetailDiamondcomponent>.from(
                  json["diamondcomponents"]!.map(
                    (x) => ProductDetailDiamondcomponent.fromJson(x),
                  ),
                ),
        stonecomponents:
            json["stonecomponents"] == null
                ? []
                : List<dynamic>.from(json["stonecomponents"]!.map((x) => x)),
        makingcomponents:
            json["makingcomponents"] == null
                ? []
                : List<ProductDetailMakingcomponent>.from(
                  json["makingcomponents"]!.map(
                    (x) => ProductDetailMakingcomponent.fromJson(x),
                  ),
                ),
        huidcomponents:
            json["huidcomponents"] == null
                ? []
                : List<dynamic>.from(json["huidcomponents"]!.map((x) => x)),
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
        huidcharges: json["huidcharges"],
        totalamount: json["totalamount"],
        gstamount: json["gstamount"],
        finalamount: json["finalamount"],
        labGrownDiamondRates: Map.from(
          json["labGrownDiamondRates"]!,
        ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
    "stockid": stockid,
    "jobno": jobno,
    "designno": designno,
    "image": image,
    "huid": huid,
    "huidCharges": huidCharges,
    "quantity": quantity,
    "metalcomponents":
        metalcomponents == null
            ? []
            : List<dynamic>.from(metalcomponents!.map((x) => x.toJson())),
    "diamondcomponents":
        diamondcomponents == null
            ? []
            : List<dynamic>.from(diamondcomponents!.map((x) => x.toJson())),
    "stonecomponents":
        stonecomponents == null
            ? []
            : List<dynamic>.from(stonecomponents!.map((x) => x)),
    "makingcomponents":
        makingcomponents == null
            ? []
            : List<dynamic>.from(makingcomponents!.map((x) => x.toJson())),
    "huidcomponents":
        huidcomponents == null
            ? []
            : List<dynamic>.from(huidcomponents!.map((x) => x)),
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
    "huidcharges": huidcharges,
    "totalamount": totalamount,
    "gstamount": gstamount,
    "finalamount": finalamount,
    "labGrownDiamondRates": Map.from(
      labGrownDiamondRates!,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class ProductDetailDiamondcomponent {
  String? material;
  String? type;
  String? shape;
  String? quality;
  String? color;
  String? size;
  int? pcs;
  double? weight;
  String? priceRatio;
  String? rateOnPcs;
  int? rate;
  int? amount;

  ProductDetailDiamondcomponent({
    this.material,
    this.type,
    this.shape,
    this.quality,
    this.color,
    this.size,
    this.pcs,
    this.weight,
    this.priceRatio,
    this.rateOnPcs,
    this.rate,
    this.amount,
  });

  factory ProductDetailDiamondcomponent.fromJson(Map<String, dynamic> json) =>
      ProductDetailDiamondcomponent(
        material: json["material"],
        type: json["type"],
        shape: json["shape"],
        quality: json["quality"],
        color: json["color"],
        size: json["size"],
        pcs: json["pcs"],
        weight: json["weight"]?.toDouble(),
        priceRatio: json["priceRatio"],
        rateOnPcs: json["rateOnPcs"],
        rate: json["rate"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
    "material": material,
    "type": type,
    "shape": shape,
    "quality": quality,
    "color": color,
    "size": size,
    "pcs": pcs,
    "weight": weight,
    "priceRatio": priceRatio,
    "rateOnPcs": rateOnPcs,
    "rate": rate,
    "amount": amount,
  };
}

class ProductDetailMakingcomponent {
  String? material;
  double? weight;
  int? rate;
  int? amount;

  ProductDetailMakingcomponent({
    this.material,
    this.weight,
    this.rate,
    this.amount,
  });

  factory ProductDetailMakingcomponent.fromJson(Map<String, dynamic> json) =>
      ProductDetailMakingcomponent(
        material: json["material"],
        weight: json["weight"]?.toDouble(),
        rate: json["rate"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
    "material": material,
    "weight": weight,
    "rate": rate,
    "amount": amount,
  };
}

class ProductDetailMetalcomponent {
  String? material;
  String? type;
  String? shape;
  String? quality;
  String? color;
  String? size;
  int? pcs;
  double? weight;
  double? priceRatio;
  String? rateOnPcs;
  String? grossweight;
  String? netweight;
  String? fineweight;
  double? rate;
  double? amount;

  ProductDetailMetalcomponent({
    this.material,
    this.type,
    this.shape,
    this.quality,
    this.color,
    this.size,
    this.pcs,
    this.weight,
    this.priceRatio,
    this.rateOnPcs,
    this.grossweight,
    this.netweight,
    this.fineweight,
    this.rate,
    this.amount,
  });

  factory ProductDetailMetalcomponent.fromJson(Map<String, dynamic> json) =>
      ProductDetailMetalcomponent(
        material: json["material"],
        type: json["type"],
        shape: json["shape"],
        quality: json["quality"],
        color: json["color"],
        size: json["size"],
        pcs: json["pcs"],
        weight: json["weight"]?.toDouble(),
        priceRatio: json["priceRatio"]?.toDouble(),
        rateOnPcs: json["rateOnPcs"],
        grossweight: json["grossweight"],
        netweight: json["netweight"],
        fineweight: json["fineweight"],
        rate: json["rate"]?.toDouble(),
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "material": material,
    "type": type,
    "shape": shape,
    "quality": quality,
    "color": color,
    "size": size,
    "pcs": pcs,
    "weight": weight,
    "priceRatio": priceRatio,
    "rateOnPcs": rateOnPcs,
    "grossweight": grossweight,
    "netweight": netweight,
    "fineweight": fineweight,
    "rate": rate,
    "amount": amount,
  };
}
