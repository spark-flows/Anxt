import 'dart:convert';

GetOneUser getOneUserFromJson(String str) => GetOneUser.fromJson(json.decode(str));

String getOneUserToJson(GetOneUser data) => json.encode(data.toJson());

class GetOneUser {
    String? message;
    GetOneUserData? data;
    int? status;
    bool? isSuccess;

    GetOneUser({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory GetOneUser.fromJson(Map<String, dynamic> json) => GetOneUser(
        message: json["Message"],
        data: json["Data"] == null ? null : GetOneUserData.fromJson(json["Data"]),
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

class GetOneUserData {
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
    String? ownername;
    String? ownermobile;
    String? managername;
    String? managermobile;
    String? refoutside;
    String? refinside;
    String? limits;
    String? status;
    String? custcategory;
    GetOneUserBankkycdetail? bankkycdetail;
    GetOneUserCreatedBy? createdBy;
    dynamic updatedBy;
    bool? isDeleted;
    dynamic deletedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<GetOneUserSale>? sales;

    GetOneUserData({
        this.id,
        this.code,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.state,
        this.city,
        this.area,
        this.zipcode,
        this.ownername,
        this.ownermobile,
        this.managername,
        this.managermobile,
        this.refoutside,
        this.refinside,
        this.limits,
        this.status,
        this.custcategory,
        this.bankkycdetail,
        this.createdBy,
        this.updatedBy,
        this.isDeleted,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
        this.sales,
    });

    factory GetOneUserData.fromJson(Map<String, dynamic> json) => GetOneUserData(
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
        ownername: json["ownername"],
        ownermobile: json["ownermobile"],
        managername: json["managername"],
        managermobile: json["managermobile"],
        refoutside: json["refoutside"],
        refinside: json["refinside"],
        limits: json["limits"],
        status: json["status"],
        custcategory: json["custcategory"],
        bankkycdetail: json["bankkycdetail"] == null ? null : GetOneUserBankkycdetail.fromJson(json["bankkycdetail"]),
        createdBy: json["createdBy"] == null ? null : GetOneUserCreatedBy.fromJson(json["createdBy"]),
        updatedBy: json["updatedBy"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        sales: json["sales"] == null ? [] : List<GetOneUserSale>.from(json["sales"]!.map((x) => GetOneUserSale.fromJson(x))),
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
        "ownername": ownername,
        "ownermobile": ownermobile,
        "managername": managername,
        "managermobile": managermobile,
        "refoutside": refoutside,
        "refinside": refinside,
        "limits": limits,
        "status": status,
        "custcategory": custcategory,
        "bankkycdetail": bankkycdetail?.toJson(),
        "createdBy": createdBy?.toJson(),
        "updatedBy": updatedBy,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "sales": sales == null ? [] : List<dynamic>.from(sales!.map((x) => x.toJson())),
    };
}

class GetOneUserBankkycdetail {
    String? bankname;
    String? acno;
    String? acholdername;
    String? ifsccode;
    GetOneUserAdharcard? adharcard;
    String? pancard;
    String? gstno;
    String? gstcertificate;
    String? cancelcheque;

    GetOneUserBankkycdetail({
        this.bankname,
        this.acno,
        this.acholdername,
        this.ifsccode,
        this.adharcard,
        this.pancard,
        this.gstno,
        this.gstcertificate,
        this.cancelcheque,
    });

    factory GetOneUserBankkycdetail.fromJson(Map<String, dynamic> json) => GetOneUserBankkycdetail(
        bankname: json["bankname"],
        acno: json["acno"],
        acholdername: json["acholdername"],
        ifsccode: json["ifsccode"],
        adharcard: json["adharcard"] == null ? null : GetOneUserAdharcard.fromJson(json["adharcard"]),
        pancard: json["pancard"],
        gstno: json["gstno"],
        gstcertificate: json["gstcertificate"],
        cancelcheque: json["cancelcheque"],
    );

    Map<String, dynamic> toJson() => {
        "bankname": bankname,
        "acno": acno,
        "acholdername": acholdername,
        "ifsccode": ifsccode,
        "adharcard": adharcard?.toJson(),
        "pancard": pancard,
        "gstno": gstno,
        "gstcertificate": gstcertificate,
        "cancelcheque": cancelcheque,
    };
}

class GetOneUserAdharcard {
    String? front;
    String? back;

    GetOneUserAdharcard({
        this.front,
        this.back,
    });

    factory GetOneUserAdharcard.fromJson(Map<String, dynamic> json) => GetOneUserAdharcard(
        front: json["front"],
        back: json["back"],
    );

    Map<String, dynamic> toJson() => {
        "front": front,
        "back": back,
    };
}

class GetOneUserCreatedBy {
    String? id;
    String? name;

    GetOneUserCreatedBy({
        this.id,
        this.name,
    });

    factory GetOneUserCreatedBy.fromJson(Map<String, dynamic> json) => GetOneUserCreatedBy(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class GetOneUserSale {
    String? id;
    String? salespersonid;
    GetOneUserCreatedBy? salesperson;
    List<GetOneUserProduct>? product;
    String? storein;
    String? storeout;
    String? duration;
    String? status;
    String? pilistatus;
    int? weight;
    String? customerneeds;
    String? customerreason;
    String? customerfeedback;
    String? customercategory;
    DateTime? nextdate;
    DateTime? nextpurchase;
    List<GetOneUserAttempt>? attempt;
    bool? isDeleted;
    String? createdBy;
    String? updatedBy;
    DateTime? createdAt;
    DateTime? updatedAt;

    GetOneUserSale({
        this.id,
        this.salespersonid,
        this.salesperson,
        this.product,
        this.storein,
        this.storeout,
        this.duration,
        this.status,
        this.pilistatus,
        this.weight,
        this.customerneeds,
        this.customerreason,
        this.customerfeedback,
        this.customercategory,
        this.nextdate,
        this.nextpurchase,
        this.attempt,
        this.isDeleted,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
    });

    factory GetOneUserSale.fromJson(Map<String, dynamic> json) => GetOneUserSale(
        id: json["_id"],
        salespersonid: json["salespersonid"],
        salesperson: json["salesperson"] == null ? null : GetOneUserCreatedBy.fromJson(json["salesperson"]),
        product: json["product"] == null ? [] : List<GetOneUserProduct>.from(json["product"]!.map((x) => GetOneUserProduct.fromJson(x))),
        storein: json["storein"],
        storeout: json["storeout"],
        duration: json["duration"],
        status: json["status"],
        pilistatus: json["pilistatus"],
        weight: json["weight"],
        customerneeds: json["customerneeds"],
        customerreason: json["customerreason"],
        customerfeedback: json["customerfeedback"],
        customercategory: json["customercategory"],
        nextdate: json["nextdate"] == null ? null : DateTime.parse(json["nextdate"]),
        nextpurchase: json["nextpurchase"] == null ? null : DateTime.parse(json["nextpurchase"]),
        attempt: json["attempt"] == null ? [] : List<GetOneUserAttempt>.from(json["attempt"]!.map((x) => GetOneUserAttempt.fromJson(x))),
        isDeleted: json["isDeleted"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "salespersonid": salespersonid,
        "salesperson": salesperson?.toJson(),
        "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
        "storein": storein,
        "storeout": storeout,
        "duration": duration,
        "status": status,
        "pilistatus": pilistatus,
        "weight": weight,
        "customerneeds": customerneeds,
        "customerreason": customerreason,
        "customerfeedback": customerfeedback,
        "customercategory": customercategory,
        "nextdate": nextdate?.toIso8601String(),
        "nextpurchase": nextpurchase?.toIso8601String(),
        "attempt": attempt == null ? [] : List<dynamic>.from(attempt!.map((x) => x.toJson())),
        "isDeleted": isDeleted,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class GetOneUserAttempt {
    int? count;
    DateTime? date;
    String? id;

    GetOneUserAttempt({
        this.count,
        this.date,
        this.id,
    });

    factory GetOneUserAttempt.fromJson(Map<String, dynamic> json) => GetOneUserAttempt(
        count: json["count"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "date": date?.toIso8601String(),
        "_id": id,
    };
}

class GetOneUserProduct {
    String? productid;
    int? weight;
    String? id;

    GetOneUserProduct({
        this.productid,
        this.weight,
        this.id,
    });

    factory GetOneUserProduct.fromJson(Map<String, dynamic> json) => GetOneUserProduct(
        productid: json["productid"],
        weight: json["weight"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productid": productid,
        "weight": weight,
        "_id": id,
    };
}
