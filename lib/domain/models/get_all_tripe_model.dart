import 'dart:convert';

GetAllTripModel getAllTripModelFromJson(String str) =>
    GetAllTripModel.fromJson(json.decode(str));

class GetAllTripModel {
  String? message;
  GetAllTripData? data;
  int? status;
  bool? isSuccess;

  GetAllTripModel({this.message, this.data, this.status, this.isSuccess});

  factory GetAllTripModel.fromJson(Map<String, dynamic> json) =>
      GetAllTripModel(
        message: json["Message"],
        data: json["Data"] == null ? null : GetAllTripData.fromJson(json["Data"]),
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

class GetAllTripData {
  List<GetAllTripDoc>? docs;
  int? page;
  int? limit;
  int? totalDocs;
  int? totalPages;
  int? totalTrips;
  int? totalBudget;
  int? totalSpent;
  int? remainingBudget;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  GetAllTripData({
    this.docs,
    this.page,
    this.limit,
    this.totalDocs,
    this.totalPages,
    this.totalTrips,
    this.totalBudget,
    this.totalSpent,
    this.remainingBudget,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory GetAllTripData.fromJson(Map<String, dynamic> json) => GetAllTripData(
    docs:
        json["docs"] == null
            ? []
            : List<GetAllTripDoc>.from(json["docs"]!.map((x) => GetAllTripDoc.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalDocs: json["totalDocs"],
    totalPages: json["totalPages"],
    totalTrips: json["totalTrips"],
    totalBudget: json["totalBudget"],
    totalSpent: json["totalSpent"],
    remainingBudget: json["remainingBudget"],
    pagingCounter: json["pagingCounter"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "docs":
        docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "totalDocs": totalDocs,
    "totalPages": totalPages,
    "totalTrips": totalTrips,
    "totalBudget": totalBudget,
    "totalSpent": totalSpent,
    "remainingBudget": remainingBudget,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class GetAllTripDoc {
  String? id;
  String? createdAt;
  int? totalExpense;
  String? creatorName;
  List<GetAllTripParticipant>? participants;
  String? tripname;
  String? purpose;
  String? status;
  String? currency;
  int? budget;
  String? start;
  String? end;
  String? location;
  String? remark;

  GetAllTripDoc({
    this.id,
    this.createdAt,
    this.totalExpense,
    this.creatorName,
    this.participants,
    this.tripname,
    this.purpose,
    this.status,
    this.currency,
    this.budget,
    this.start,
    this.end,
    this.location,
    this.remark,
  });

  factory GetAllTripDoc.fromJson(Map<String, dynamic> json) => GetAllTripDoc(
    id: json["_id"],
    createdAt: json["createdAt"],
    totalExpense: json["totalExpense"],
    creatorName: json["creatorName"],
    participants:
        json["participants"] == null
            ? []
            : List<GetAllTripParticipant>.from(
              json["participants"]!.map((x) => GetAllTripParticipant.fromJson(x)),
            ),
    tripname: json["tripname"],
    purpose: json["purpose"],
    status: json["status"],
    currency: json["currency"],
    budget: json["budget"],
    start: json["start"],
    end: json["end"],
    location: json["location"],
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdAt": createdAt,
    "totalExpense": totalExpense,
    "creatorName": creatorName,
    "participants":
        participants == null
            ? []
            : List<dynamic>.from(participants!.map((x) => x.toJson())),
    "tripname": tripname,
    "purpose": purpose,
    "status": status,
    "currency": currency,
    "budget": budget,
    "start": start,
    "end": end,
    "location": location,
    "remark": remark,
  };
}

class GetAllTripParticipant {
  String? id;
  String? name;
  String? email;
  String? mobile;

  GetAllTripParticipant({this.id, this.name, this.email, this.mobile});

  factory GetAllTripParticipant.fromJson(Map<String, dynamic> json) => GetAllTripParticipant(
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
