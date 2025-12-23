import 'dart:convert';

GetOneCartModel getOneCartModelFromJson(String str) =>
    GetOneCartModel.fromJson(json.decode(str));

String getOneCartModelToJson(GetOneCartModel data) =>
    json.encode(data.toJson());

class GetOneCartModel {
  String? message;
  GetOneCartData? data;
  int? status;
  bool? isSuccess;

  GetOneCartModel({this.message, this.data, this.status, this.isSuccess});

  factory GetOneCartModel.fromJson(Map<String, dynamic> json) =>
      GetOneCartModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetOneCartData.fromJson(json["Data"]),
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

class GetOneCartData {
  String? id;
  GetOneCartCustomerid? customerid;
  GetOneCartSales? salesmanid;
  GetOneCartSales? salesexecutiveid;
  String? salesid;
  String? huid;
  List<GetOneCartItem>? items;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  String? userid;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  GetOneCartProductSummary? productSummary;
  GetOneCartCalculationSummary? summary;

  GetOneCartData({
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
    this.productSummary,
    this.summary,
  });

  factory GetOneCartData.fromJson(Map<String, dynamic> json) => GetOneCartData(
    id: json["_id"],
    customerid:
        json["customerid"] == null
            ? null
            : GetOneCartCustomerid.fromJson(json["customerid"]),
    salesmanid:
        json["salesmanid"] == null
            ? null
            : GetOneCartSales.fromJson(json["salesmanid"]),
    salesexecutiveid:
        json["salesexecutiveid"] == null
            ? null
            : GetOneCartSales.fromJson(json["salesexecutiveid"]),
    salesid: json["salesid"],
    huid: json["huid"],
    items:
        json["items"] == null
            ? []
            : List<GetOneCartItem>.from(
              json["items"]!.map((x) => GetOneCartItem.fromJson(x)),
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
    productSummary:
        json["productSummary"] == null
            ? null
            : GetOneCartProductSummary.fromJson(json["productSummary"]),
    summary:
        json["summary"] == null
            ? null
            : GetOneCartCalculationSummary.fromJson(json["summary"]),
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
    "productSummary": productSummary?.toJson(),
    "summary": summary?.toJson(),
  };
}

class GetOneCartCustomerid {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? address;

  GetOneCartCustomerid({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
  });

  factory GetOneCartCustomerid.fromJson(Map<String, dynamic> json) =>
      GetOneCartCustomerid(
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

class GetOneCartItem {
  String? jobno;
  String? designno;
  String? category;
  String? subcategory;
  String? metalQuality;
  String? image;
  int? quantity;
  String? huid;
  GetOneCartItemSummary? summary;
  String? pricemasternameid;
  String? makingrate;
  String? stonerate;
  String? id;
  GetOneCartCalculation? calculation;
  String? subtotal;

  GetOneCartItem({
    this.jobno,
    this.designno,
    this.category,
    this.subcategory,
    this.metalQuality,
    this.image,
    this.quantity,
    this.huid,
    this.summary,
    this.pricemasternameid,
    this.makingrate,
    this.stonerate,
    this.id,
    this.calculation,
    this.subtotal,
  });

  factory GetOneCartItem.fromJson(Map<String, dynamic> json) => GetOneCartItem(
    jobno: json["jobno"],
    designno: json["designno"],
    category: json["category"],
    subcategory: json["subcategory"],
    metalQuality: json["metalQuality"],
    image: json["image"],
    quantity: json["quantity"],
    huid: json["huid"],
    summary:
        json["summary"] == null
            ? null
            : GetOneCartItemSummary.fromJson(json["summary"]),
    pricemasternameid: json["pricemasternameid"],
    makingrate: json["makingrate"],
    stonerate: json["stonerate"],
    id: json["_id"],
    calculation:
        json["calculation"] == null
            ? null
            : GetOneCartCalculation.fromJson(json["calculation"]),
    subtotal: json["subtotal"],
  );

  Map<String, dynamic> toJson() => {
    "jobno": jobno,
    "designno": designno,
    "category": category,
    "subcategory": subcategory,
    "metalQuality": metalQuality,
    "image": image,
    "quantity": quantity,
    "huid": huid,
    "summary": summary?.toJson(),
    "pricemasternameid": pricemasternameid,
    "makingrate": makingrate,
    "stonerate": stonerate,
    "_id": id,
    "calculation": calculation?.toJson(),
    "subtotal": subtotal,
  };
}

class GetOneCartCalculation {
  List<GetOneCartComponent>? components;
  GetOneCartCalculationSummary? summary;

  GetOneCartCalculation({this.components, this.summary});

  factory GetOneCartCalculation.fromJson(Map<String, dynamic> json) =>
      GetOneCartCalculation(
        components:
            json["components"] == null
                ? []
                : List<GetOneCartComponent>.from(
                  json["components"]!.map(
                    (x) => GetOneCartComponent.fromJson(x),
                  ),
                ),
        summary:
            json["summary"] == null
                ? null
                : GetOneCartCalculationSummary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
    "components":
        components == null
            ? []
            : List<dynamic>.from(components!.map((x) => x.toJson())),
    "summary": summary?.toJson(),
  };
}

class GetOneCartComponent {
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

  GetOneCartComponent({
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

  factory GetOneCartComponent.fromJson(Map<String, dynamic> json) =>
      GetOneCartComponent(
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

class GetOneCartCalculationSummary {
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
  int? huidPcs;
  String? subtotal;
  int? totalQuantity;
  String? huidTotal;

  GetOneCartCalculationSummary({
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
    this.huidPcs,
    this.subtotal,
    this.totalQuantity,
    this.huidTotal,
  });

  factory GetOneCartCalculationSummary.fromJson(Map<String, dynamic> json) =>
      GetOneCartCalculationSummary(
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
        huidPcs: json["huidPcs"],
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
    "huidPcs": huidPcs,
    "subtotal": subtotal,
    "totalQuantity": totalQuantity,
    "huidTotal": huidTotal,
  };
}

class GetOneCartItemSummary {
  String? grossweight;
  String? metalamount;
  String? diamondamount;
  String? makingcharges;
  String? huidcharges;
  String? totalamount;

  GetOneCartItemSummary({
    this.grossweight,
    this.metalamount,
    this.diamondamount,
    this.makingcharges,
    this.huidcharges,
    this.totalamount,
  });

  factory GetOneCartItemSummary.fromJson(Map<String, dynamic> json) =>
      GetOneCartItemSummary(
        grossweight: json["grossweight"],
        metalamount: json["metalamount"],
        diamondamount: json["diamondamount"],
        makingcharges: json["makingcharges"],
        huidcharges: json["huidcharges"],
        totalamount: json["totalamount"],
      );

  Map<String, dynamic> toJson() => {
    "grossweight": grossweight,
    "metalamount": metalamount,
    "diamondamount": diamondamount,
    "makingcharges": makingcharges,
    "huidcharges": huidcharges,
    "totalamount": totalamount,
  };
}

class GetOneCartProductSummary {
  int? bangles;
  int? earrings;
  int? totalItems;

  GetOneCartProductSummary({this.bangles, this.earrings, this.totalItems});

  factory GetOneCartProductSummary.fromJson(Map<String, dynamic> json) =>
      GetOneCartProductSummary(
        bangles: json["BANGLES"],
        earrings: json["EARRINGS"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
    "BANGLES": bangles,
    "EARRINGS": earrings,
    "totalItems": totalItems,
  };
}

class GetOneCartSales {
  String? id;
  String? name;

  GetOneCartSales({this.id, this.name});

  factory GetOneCartSales.fromJson(Map<String, dynamic> json) =>
      GetOneCartSales(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
