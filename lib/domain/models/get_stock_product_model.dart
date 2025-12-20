import 'dart:convert';

GetStockProductModel getStockProductModelFromJson(String str) =>
    GetStockProductModel.fromJson(json.decode(str));

String getStockProductModelToJson(GetStockProductModel data) =>
    json.encode(data.toJson());

class GetStockProductModel {
  String? message;
  List<GetStockProductDatum>? data;
  int? status;
  bool? isSuccess;

  GetStockProductModel({this.message, this.data, this.status, this.isSuccess});

  factory GetStockProductModel.fromJson(Map<String, dynamic> json) =>
      GetStockProductModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? []
                : List<GetStockProductDatum>.from(
                  json["Data"]!.map((x) => GetStockProductDatum.fromJson(x)),
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

class GetStockProductDatum {
  String? id;
  String? jobno;
  String? designno;
  String? collection;
  String? collectionid;
  String? stockcatelogueid;
  String? categoryid;
  String? subcategoryid;
  String? category;
  String? subcategory;
  String? material;
  String? type;
  String? shape;
  String? quality;
  String? color;
  String? size;
  String? oldtag;
  bool? status;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  List<GetStockProductComponent>? components;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  double? totalGrossWeight;
  double? totalDiamondCts;
  int? totalDiamondPcs;
  int? totalCsWeight;
  double? metalweight;
  String? metalQuality;
  String? metalColor;

  GetStockProductDatum({
    this.id,
    this.jobno,
    this.designno,
    this.collection,
    this.collectionid,
    this.stockcatelogueid,
    this.categoryid,
    this.subcategoryid,
    this.category,
    this.subcategory,
    this.material,
    this.type,
    this.shape,
    this.quality,
    this.color,
    this.size,
    this.oldtag,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.components,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalGrossWeight,
    this.totalDiamondCts,
    this.totalDiamondPcs,
    this.totalCsWeight,
    this.metalweight,
    this.metalQuality,
    this.metalColor,
  });

  factory GetStockProductDatum.fromJson(
    Map<String, dynamic> json,
  ) => GetStockProductDatum(
    id: json["_id"],
    jobno: json["jobno"],
    designno: json["designno"],
    collection: json["collection"],
    collectionid: json["collectionid"],
    stockcatelogueid: json["stockcatelogueid"],
    categoryid: json["categoryid"],
    subcategoryid: json["subcategoryid"],
    category: json["category"],
    subcategory: json["subcategory"],
    material: json["material"],
    type: json["type"],
    shape: json["shape"],
    quality: json["quality"],
    color: json["color"],
    size: json["size"],
    oldtag: json["oldtag"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    components:
        json["components"] == null
            ? []
            : List<GetStockProductComponent>.from(
              json["components"]!.map(
                (x) => GetStockProductComponent.fromJson(x),
              ),
            ),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    totalGrossWeight: json["totalGrossWeight"]?.toDouble(),
    totalDiamondCts: json["totalDiamondCts"]?.toDouble(),
    totalDiamondPcs: json["totalDiamondPcs"],
    totalCsWeight: json["totalCSWeight"],
    metalweight: json["metalweight"]?.toDouble(),
    metalQuality: json["metalQuality"],
    metalColor: json["metalColor"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "jobno": jobno,
    "designno": designno,
    "collection": collection,
    "collectionid": collectionid,
    "stockcatelogueid": stockcatelogueid,
    "categoryid": categoryid,
    "subcategoryid": subcategoryid,
    "category": category,
    "subcategory": subcategory,
    "material": material,
    "type": type,
    "shape": shape,
    "quality": quality,
    "color": color,
    "size": size,
    "oldtag": oldtag,
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "components":
        components == null
            ? []
            : List<dynamic>.from(components!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "totalGrossWeight": totalGrossWeight,
    "totalDiamondCts": totalDiamondCts,
    "totalDiamondPcs": totalDiamondPcs,
    "totalCSWeight": totalCsWeight,
    "metalweight": metalweight,
    "metalQuality": metalQuality,
    "metalColor": metalColor,
  };
}

class GetStockProductComponent {
  String? material;
  String? type;
  String? shape;
  String? quality;
  String? color;
  String? size;
  int? pcs;
  double? weight;
  dynamic priceRatio;
  String? rateOnPcs;

  GetStockProductComponent({
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
  });

  factory GetStockProductComponent.fromJson(Map<String, dynamic> json) =>
      GetStockProductComponent(
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
  };
}
