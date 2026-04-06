import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) =>
    ExpenseModel.fromJson(json.decode(str));

class ExpenseModel {
  String? message;
  ExpenseData? data;
  int? status;
  bool? isSuccess;

  ExpenseModel({this.message, this.data, this.status, this.isSuccess});

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    message: json["Message"],
    data: json["Data"] == null ? null : ExpenseData.fromJson(json["Data"]),
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

class ExpenseData {
  List<ExpenseDoc>? docs;
  int? totalDocs;
  int? totalPages;
  int? page;
  int? limit;
  bool? hasNextPage;
  bool? hasPrevPage;

  ExpenseData({
    this.docs,
    this.totalDocs,
    this.totalPages,
    this.page,
    this.limit,
    this.hasNextPage,
    this.hasPrevPage,
  });

  factory ExpenseData.fromJson(Map<String, dynamic> json) => ExpenseData(
    docs:
        json["docs"] == null
            ? []
            : List<ExpenseDoc>.from(
              json["docs"]!.map((x) => ExpenseDoc.fromJson(x)),
            ),
    totalDocs: json["totalDocs"],
    totalPages: json["totalPages"],
    page: json["page"],
    limit: json["limit"],
    hasNextPage: json["hasNextPage"],
    hasPrevPage: json["hasPrevPage"],
  );

  Map<String, dynamic> toJson() => {
    "docs":
        docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "totalPages": totalPages,
    "page": page,
    "limit": limit,
    "hasNextPage": hasNextPage,
    "hasPrevPage": hasPrevPage,
  };
}

class ExpenseDoc {
  String? id;
  String? title;
  String? amount;
  String? date;
  String? receipt;
  bool? status;
  String? createdAt;
  Trip? trip;
  ExpCategory? expCategory;
  ExpBy? expBy;

  ExpenseDoc({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.receipt,
    this.status,
    this.createdAt,
    this.trip,
    this.expCategory,
    this.expBy,
  });

  factory ExpenseDoc.fromJson(Map<String, dynamic> json) => ExpenseDoc(
    id: json["_id"],
    title: json["title"],
    amount: json["amount"],
    date: json["date"],
    receipt: json["receipt"],
    status: json["status"],
    createdAt: json["createdAt"],
    trip: json["trip"] == null ? null : Trip.fromJson(json["trip"]),
    expCategory:
        json["exp_Category"] == null
            ? null
            : ExpCategory.fromJson(json["exp_Category"]),
    expBy: json["Exp_by"] == null ? null : ExpBy.fromJson(json["Exp_by"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "amount": amount,
    "date": date,
    "receipt": receipt,
    "status": status,
    "createdAt": createdAt,
    "trip": trip?.toJson(),
    "exp_Category": expCategory?.toJson(),
    "Exp_by": expBy?.toJson(),
  };
}

class ExpBy {
  String? id;
  String? name;
  String? email;
  String? mobile;

  ExpBy({this.id, this.name, this.email, this.mobile});

  factory ExpBy.fromJson(Map<String, dynamic> json) => ExpBy(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
  };
}

class ExpCategory {
  String? id;
  String? name;

  ExpCategory({this.id, this.name});

  factory ExpCategory.fromJson(Map<String, dynamic> json) =>
      ExpCategory(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}

class Trip {
  String? id;
  String? tripname;
  String? status;
  String? currency;

  Trip({this.id, this.tripname, this.status, this.currency});

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    id: json["_id"],
    tripname: json["tripname"],
    status: json["status"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tripname": tripname,
    "status": status,
    "currency": currency,
  };
}
