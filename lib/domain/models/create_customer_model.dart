import 'dart:convert';

CreateCustomerModel createCustomerModelFromJson(String str) => CreateCustomerModel.fromJson(json.decode(str));

String createCustomerModelToJson(CreateCustomerModel data) => json.encode(data.toJson());

class CreateCustomerModel {
  String message;
  CreateCustomerData data;
  int status;
  bool isSuccess;

  CreateCustomerModel({required this.message, required this.data, required this.status, required this.isSuccess});

  factory CreateCustomerModel.fromJson(Map<String, dynamic> json) => CreateCustomerModel(
    message: json["Message"],
    data: CreateCustomerData.fromJson(json["Data"]),
    status: json["Status"],
    isSuccess: json["IsSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Data": data.toJson(),
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class CreateCustomerData {
  String code;
  String name;
  String email;
  String mobile;
  String address;
  String state;
  String city;
  String area;
  String zipcode;
  String assignby;
  String ownername;
  String ownermobile;
  String managername;
  String managermobile;
  CreateCustomerBankkycdetail bankkycdetail;
  String type;
  bool isVerified;
  String channelid;
  bool isDeleted;
  String deletedBy;
  String createdBy;
  String updatedBy;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String dataId;

  CreateCustomerData({
    required this.code,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
    required this.state,
    required this.city,
    required this.area,
    required this.zipcode,
    required this.assignby,
    required this.ownername,
    required this.ownermobile,
    required this.managername,
    required this.managermobile,
    required this.bankkycdetail,
    required this.type,
    required this.isVerified,
    required this.channelid,
    required this.isDeleted,
    required this.deletedBy,
    required this.createdBy,
    required this.updatedBy,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.dataId,
  });

  factory CreateCustomerData.fromJson(Map<String, dynamic> json) => CreateCustomerData(
    code: json["code"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    state: json["state"],
    city: json["city"],
    area: json["area"],
    zipcode: json["zipcode"],
    assignby: json["assignby"],
    ownername: json["ownername"],
    ownermobile: json["ownermobile"],
    managername: json["managername"],
    managermobile: json["managermobile"],
    bankkycdetail:
        json["bankkycdetail"] != null
            ? CreateCustomerBankkycdetail.fromJson(json["bankkycdetail"])
            : CreateCustomerBankkycdetail.empty(),

    type: json["type"],
    isVerified: json["isVerified"],
    channelid: json["channelid"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    dataId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "state": state,
    "city": city,
    "area": area,
    "zipcode": zipcode,
    "assignby": assignby,
    "ownername": ownername,
    "ownermobile": ownermobile,
    "managername": managername,
    "managermobile": managermobile,
    "bankkycdetail": bankkycdetail.toJson(),
    "type": type,
    "isVerified": isVerified,
    "channelid": channelid,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": dataId,
  };
}

class CreateCustomerBankkycdetail {
  String bankname;
  String acno;
  String acholdername;
  String ifsccode;
  CreateCustomerAdharcard adharcard;
  String pancard;
  String gstno;
  String gstcertificate;
  String cancelcheque;

  CreateCustomerBankkycdetail({
    required this.bankname,
    required this.acno,
    required this.acholdername,
    required this.ifsccode,
    required this.adharcard,
    required this.pancard,
    required this.gstno,
    required this.gstcertificate,
    required this.cancelcheque,
  });

  factory CreateCustomerBankkycdetail.empty() => CreateCustomerBankkycdetail(
    bankname: "",
    acno: "",
    acholdername: "",
    ifsccode: "",
    adharcard: CreateCustomerAdharcard.empty(),
    pancard: "",
    gstno: "",
    gstcertificate: "",
    cancelcheque: "",
  );

  factory CreateCustomerBankkycdetail.fromJson(Map<String, dynamic> json) => CreateCustomerBankkycdetail(
    bankname: json["bankname"] ?? "",
    acno: json["acno"] ?? "",
    acholdername: json["acholdername"] ?? "",
    ifsccode: json["ifsccode"] ?? "",
    adharcard:
        json["adharcard"] != null
            ? CreateCustomerAdharcard.fromJson(json["adharcard"])
            : CreateCustomerAdharcard.empty(),
    pancard: json["pancard"] ?? "",
    gstno: json["gstno"] ?? "",
    gstcertificate: json["gstcertificate"] ?? "",
    cancelcheque: json["cancelcheque"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "bankname": bankname,
    "acno": acno,
    "acholdername": acholdername,
    "ifsccode": ifsccode,
    "adharcard": adharcard.toJson(),
    "pancard": pancard,
    "gstno": gstno,
    "gstcertificate": gstcertificate,
    "cancelcheque": cancelcheque,
  };
}

class CreateCustomerAdharcard {
  String front;
  String back;

  CreateCustomerAdharcard({required this.front, required this.back});

  factory CreateCustomerAdharcard.fromJson(Map<String, dynamic> json) =>
      CreateCustomerAdharcard(front: json["front"] ?? "", back: json["back"] ?? "");

  factory CreateCustomerAdharcard.empty() => CreateCustomerAdharcard(front: "", back: "");

  Map<String, dynamic> toJson() => {"front": front, "back": back};
}
