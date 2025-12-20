// To parse this JSON data, do
//
//     final getOrderListModel = getOrderListModelFromJson(jsonString);

import 'dart:convert';

GetOrderListModel getOrderListModelFromJson(String str) =>
    GetOrderListModel.fromJson(json.decode(str));

String getOrderListModelToJson(GetOrderListModel data) =>
    json.encode(data.toJson());

class GetOrderListModel {
  String? message;
  GetOrderListData? data;
  num? status;
  bool? isSuccess;

  GetOrderListModel({this.message, this.data, this.status, this.isSuccess});

  factory GetOrderListModel.fromJson(
    Map<String, dynamic> json,
  ) => GetOrderListModel(
    message: json["Message"],
    data: json["Data"] == null ? null : GetOrderListData.fromJson(json["Data"]),
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

class GetOrderListData {
  List<GetOrderListDoc>? docs;
  num? totalDocs;
  GetOrderListTotals? totals;
  num? limit;
  num? totalPages;
  num? page;
  num? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  GetOrderListData({
    this.docs,
    this.totalDocs,
    this.totals,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory GetOrderListData.fromJson(Map<String, dynamic> json) =>
      GetOrderListData(
        docs:
            json["docs"] == null
                ? []
                : List<GetOrderListDoc>.from(
                  json["docs"]!.map((x) => GetOrderListDoc.fromJson(x)),
                ),
        totalDocs: json["totalDocs"],
        totals:
            json["totals"] == null
                ? null
                : GetOrderListTotals.fromJson(json["totals"]),
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
    "totals": totals?.toJson(),
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

class GetOrderListDoc {
  String? id;
  String? orderno;
  GetOrderListSalesexecutiveid? salesexecutiveid;
  GetOrderListCustomerid? customerid;
  String? discount;
  String? discounttype;
  GetOrderListSummary? summary;
  List<GetOrderListItem>? items;
  String? status;
  DateTime? createdAt;
  GetOrderListPricemasternameid? pricemasternameid;
  GetOrderListPricemasternameid? salesmanid;
  num? quantity;
  num? huidChargesNum;

  GetOrderListDoc({
    this.id,
    this.orderno,
    this.salesexecutiveid,
    this.customerid,
    this.discount,
    this.discounttype,
    this.summary,
    this.items,
    this.status,
    this.createdAt,
    this.pricemasternameid,
    this.salesmanid,
    this.quantity,
    this.huidChargesNum,
  });

  factory GetOrderListDoc.fromJson(
    Map<String, dynamic> json,
  ) => GetOrderListDoc(
    id: json["_id"],
    orderno: json["orderno"],
    salesexecutiveid:
        json["salesexecutiveid"] == null
            ? null
            : GetOrderListSalesexecutiveid.fromJson(json["salesexecutiveid"]),
    customerid:
        json["customerid"] == null
            ? null
            : GetOrderListCustomerid.fromJson(json["customerid"]),
    discount: json["discount"],
    discounttype: json["discounttype"],
    summary:
        json["summary"] == null
            ? null
            : GetOrderListSummary.fromJson(json["summary"]),
    items:
        json["items"] == null
            ? []
            : List<GetOrderListItem>.from(
              json["items"]!.map((x) => GetOrderListItem.fromJson(x)),
            ),
    status: json["status"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    pricemasternameid:
        json["pricemasternameid"] == null
            ? null
            : GetOrderListPricemasternameid.fromJson(json["pricemasternameid"]),
    salesmanid:
        json["salesmanid"] == null
            ? null
            : GetOrderListPricemasternameid.fromJson(json["salesmanid"]),
    quantity: json["quantity"],
    huidChargesNum: json["huidChargesNum"],
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
    "createdAt": createdAt?.toIso8601String(),
    "pricemasternameid": pricemasternameid?.toJson(),
    "salesmanid": salesmanid?.toJson(),
    "quantity": quantity,
    "huidChargesNum": huidChargesNum,
  };
}

class GetOrderListCustomerid {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? storeaddress;

  GetOrderListCustomerid({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.storeaddress,
  });

  factory GetOrderListCustomerid.fromJson(Map<String, dynamic> json) =>
      GetOrderListCustomerid(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        storeaddress: json["storeaddress"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "storeaddress": storeaddress,
  };
}

class GetOrderListItem {
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
  String? huid;
  dynamic diamondamount;
  List<GetOrderListComponent>? components;
  String? itemTotal;

  GetOrderListItem({
    this.grossweight,
    this.netweight,
    this.fineweight,
    this.diamondcts,
    this.diamondpcs,
    this.stoneweight,
    this.stoneamount,
    this.makingcharges,
    this.huidcharges,
    this.gstpercent,
    this.totalamount,
    this.finalamount,
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

  factory GetOrderListItem.fromJson(Map<String, dynamic> json) =>
      GetOrderListItem(
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
                : List<GetOrderListComponent>.from(
                  json["components"]!.map(
                    (x) => GetOrderListComponent.fromJson(x),
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

class GetOrderListComponent {
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

  GetOrderListComponent({
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

  factory GetOrderListComponent.fromJson(Map<String, dynamic> json) =>
      GetOrderListComponent(
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

class GetOrderListPricemasternameid {
  GetOrderListPricemasternameid();

  factory GetOrderListPricemasternameid.fromJson(Map<String, dynamic> json) =>
      GetOrderListPricemasternameid();

  Map<String, dynamic> toJson() => {};
}

class GetOrderListSalesexecutiveid {
  String? id;
  String? name;

  GetOrderListSalesexecutiveid({this.id, this.name});

  factory GetOrderListSalesexecutiveid.fromJson(Map<String, dynamic> json) =>
      GetOrderListSalesexecutiveid(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}

class GetOrderListSummary {
  num? quantity;
  String? grossweight;
  String? netweight;
  String? fineweight;
  dynamic metalamount;
  String? diamondcts;
  num? diamondpcs;
  String? diamondamount;
  String? stoneweight;
  String? stoneamount;
  String? makingcharges;
  num? huidcharges;
  String? totalamount;
  double? gstamount;
  String? taxable;
  String? discountamount;
  num? gstpercent;
  String? finalamount;

  GetOrderListSummary({
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
    this.huidcharges,
    this.totalamount,
    this.gstamount,
    this.taxable,
    this.discountamount,
    this.gstpercent,
    this.finalamount,
  });

  factory GetOrderListSummary.fromJson(Map<String, dynamic> json) =>
      GetOrderListSummary(
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
        huidcharges: json["huidcharges"],
        totalamount: json["totalamount"],
        gstamount: json["gstamount"]?.toDouble(),
        taxable: json["taxable"],
        discountamount: json["discountamount"],
        gstpercent: json["gstpercent"],
        finalamount: json["finalamount"],
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
    "huidcharges": huidcharges,
    "totalamount": totalamount,
    "gstamount": gstamount,
    "taxable": taxable,
    "discountamount": discountamount,
    "gstpercent": gstpercent,
    "finalamount": finalamount,
  };
}

class GetOrderListTotals {
  num? quantity;
  String? grossweight;
  String? netweight;
  String? fineweight;
  String? metalamount;
  String? diamondcts;
  num? diamondpcs;
  String? diamondamount;
  String? stoneweight;
  String? stoneamount;
  String? makingcharges;
  String? huidcharges;
  String? totalamount;
  String? gstamount;
  String? discountamount;
  String? finalamount;

  GetOrderListTotals({
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
    this.huidcharges,
    this.totalamount,
    this.gstamount,
    this.discountamount,
    this.finalamount,
  });

  factory GetOrderListTotals.fromJson(Map<String, dynamic> json) =>
      GetOrderListTotals(
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
        huidcharges: json["huidcharges"],
        totalamount: json["totalamount"],
        gstamount: json["gstamount"],
        discountamount: json["discountamount"],
        finalamount: json["finalamount"],
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
    "huidcharges": huidcharges,
    "totalamount": totalamount,
    "gstamount": gstamount,
    "discountamount": discountamount,
    "finalamount": finalamount,
  };
}
