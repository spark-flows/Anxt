import 'dart:convert';

GetAllTripModel getAllTripModelFromJson(String str) =>
    GetAllTripModel.fromJson(json.decode(str));

String getAllTripModelToJson(GetAllTripModel data) =>
    json.encode(data.toJson());

class GetAllTripModel {
  final String message;
  final GetAllTripData data;
  final int status;
  final bool isSuccess;

  GetAllTripModel({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  GetAllTripModel copyWith({
    String? message,
    GetAllTripData? data,
    int? status,
    bool? isSuccess,
  }) => GetAllTripModel(
    message: message ?? this.message,
    data: data ?? this.data,
    status: status ?? this.status,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  factory GetAllTripModel.fromJson(Map<String, dynamic> json) =>
      GetAllTripModel(
        message: json["Message"],
        data: GetAllTripData.fromJson(json["Data"]),
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

class GetAllTripData {
  final List<GetAllTripDoc> docs;
  final int page;
  final int limit;
  final int totalDocs;
  final int totalPages;
  final int totalTrips;
  final int totalBudget;
  final int totalSpent;
  final int remainingBudget;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final dynamic prevPage;
  final dynamic nextPage;

  GetAllTripData({
    required this.docs,
    required this.page,
    required this.limit,
    required this.totalDocs,
    required this.totalPages,
    required this.totalTrips,
    required this.totalBudget,
    required this.totalSpent,
    required this.remainingBudget,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  GetAllTripData copyWith({
    List<GetAllTripDoc>? docs,
    int? page,
    int? limit,
    int? totalDocs,
    int? totalPages,
    int? totalTrips,
    int? totalBudget,
    int? totalSpent,
    int? remainingBudget,
    int? pagingCounter,
    bool? hasPrevPage,
    bool? hasNextPage,
    dynamic prevPage,
    dynamic nextPage,
  }) => GetAllTripData(
    docs: docs ?? this.docs,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    totalDocs: totalDocs ?? this.totalDocs,
    totalPages: totalPages ?? this.totalPages,
    totalTrips: totalTrips ?? this.totalTrips,
    totalBudget: totalBudget ?? this.totalBudget,
    totalSpent: totalSpent ?? this.totalSpent,
    remainingBudget: remainingBudget ?? this.remainingBudget,
    pagingCounter: pagingCounter ?? this.pagingCounter,
    hasPrevPage: hasPrevPage ?? this.hasPrevPage,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    prevPage: prevPage ?? this.prevPage,
    nextPage: nextPage ?? this.nextPage,
  );

  factory GetAllTripData.fromJson(Map<String, dynamic> json) => GetAllTripData(
    docs: List<GetAllTripDoc>.from(json["docs"].map((x) => GetAllTripDoc.fromJson(x))),
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
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
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
  final String id;
  final String branchid;
  final String tripname;
  final String purpose;
  final String status;
  final int budget;
  final DateTime start;
  final DateTime end;
  final String location;
  final String remark;
  final DateTime createdAt;
  final int totalExpense;
  final String creatorName;
  final List<GetAllTripParticipant> participants;

  GetAllTripDoc({
    required this.id,
    required this.branchid,
    required this.tripname,
    required this.purpose,
    required this.status,
    required this.budget,
    required this.start,
    required this.end,
    required this.location,
    required this.remark,
    required this.createdAt,
    required this.totalExpense,
    required this.creatorName,
    required this.participants,
  });

  GetAllTripDoc copyWith({
    String? id,
    String? branchid,
    String? tripname,
    String? purpose,
    String? status,
    int? budget,
    DateTime? start,
    DateTime? end,
    String? location,
    String? remark,
    DateTime? createdAt,
    int? totalExpense,
    String? creatorName,
    List<GetAllTripParticipant>? participants,
  }) => GetAllTripDoc(
    id: id ?? this.id,
    branchid: branchid ?? this.branchid,
    tripname: tripname ?? this.tripname,
    purpose: purpose ?? this.purpose,
    status: status ?? this.status,
    budget: budget ?? this.budget,
    start: start ?? this.start,
    end: end ?? this.end,
    location: location ?? this.location,
    remark: remark ?? this.remark,
    createdAt: createdAt ?? this.createdAt,
    totalExpense: totalExpense ?? this.totalExpense,
    creatorName: creatorName ?? this.creatorName,
    participants: participants ?? this.participants,
  );

  factory GetAllTripDoc.fromJson(Map<String, dynamic> json) => GetAllTripDoc(
    id: json["_id"]??"",
    branchid: json["branchid"] ?? "",
    tripname: json["tripname"]??"",
    purpose: json["purpose"]??"",
    status: json["status"]??"",
    budget: json["budget"] ?? 0,
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    location: json["location"] ?? "",
    remark: json["remark"] ??"",
    createdAt: DateTime.parse(json["createdAt"]),
    totalExpense: json["totalExpense"] ?? 0,
    creatorName: json["creatorName"] ?? "",
    participants: json["participants"] ==null ? [] :  List<GetAllTripParticipant>.from(
      json["participants"].map((x) => GetAllTripParticipant.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "branchid": branchid,
    "tripname": tripname,
    "purpose": purpose,
    "status": status,
    "budget": budget,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "location": location,
    "remark": remark,
    "createdAt": createdAt.toIso8601String(),
    "totalExpense": totalExpense,
    "creatorName": creatorName,
    "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
  };
}

class GetAllTripParticipant {
  final String id;
  final String name;
  final String email;
  final String mobile;

  GetAllTripParticipant({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  GetAllTripParticipant copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
  }) => GetAllTripParticipant(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    mobile: mobile ?? this.mobile,
  );

  factory GetAllTripParticipant.fromJson(Map<String, dynamic> json) =>
      GetAllTripParticipant(
        id: json["_id"]??"",
        name: json["name"]??"",
        email: json["email"]??"",
        mobile: json["mobile"]??"",
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
  };
}
