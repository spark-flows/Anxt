import 'dart:convert';

GetAllUsesList getAllUsesListFromJson(String str) =>
    GetAllUsesList.fromJson(json.decode(str));

String getAllUsesListToJson(GetAllUsesList data) => json.encode(data.toJson());

class GetAllUsesList {
  String? message;
  GetAllUsesData? data;
  int? status;
  bool? isSuccess;

  GetAllUsesList({this.message, this.data, this.status, this.isSuccess});

  factory GetAllUsesList.fromJson(Map<String, dynamic> json) => GetAllUsesList(
    message: json["Message"],
    data: json["Data"] == null ? null : GetAllUsesData.fromJson(json["Data"]),
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

class GetAllUsesData {
  List<GetAllUsesDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  GetAllUsesData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory GetAllUsesData.fromJson(Map<String, dynamic> json) => GetAllUsesData(
    docs:
        json["docs"] == null
            ? []
            : List<GetAllUsesDoc>.from(
              json["docs"]!.map((x) => GetAllUsesDoc.fromJson(x)),
            ),
    totalDocs: json["totalDocs"],
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

class GetAllUsesDoc {
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
  String? type;
  bool? status;
  DateTime? createdAt;
  GetAllUsesAssignby? salesperson;
  GetAllUsesAssignby? assignby;
  int? attempt;
  String? pilistatus;

  GetAllUsesDoc({
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
    this.type,
    this.status,
    this.createdAt,
    this.salesperson,
    this.assignby,
    this.attempt,
    this.pilistatus,
  });

  factory GetAllUsesDoc.fromJson(Map<String, dynamic> json) => GetAllUsesDoc(
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
    type: json["type"],
    status: json["status"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    salesperson:
        json["salesperson"] == null
            ? null
            : GetAllUsesAssignby.fromJson(json["salesperson"]),
    assignby:
        json["assignby"] == null
            ? null
            : GetAllUsesAssignby.fromJson(json["assignby"]),
    attempt: json["attempt"],
    pilistatus: json["pilistatus"],
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
    "type": type,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "salesperson": salesperson?.toJson(),
    "assignby": assignby?.toJson(),
    "attempt": attempt ?? 0,
    "pilistatus": pilistatus,
  };
}

class GetAllUsesAssignby {
  GetAllUsesAssignby();

  factory GetAllUsesAssignby.fromJson(Map<String, dynamic> json) =>
      GetAllUsesAssignby();

  Map<String, dynamic> toJson() => {};
}

class GetAllUsesAttempt {
  int? count;
  DateTime? date;
  String? id;

  GetAllUsesAttempt({this.count, this.date, this.id});

  factory GetAllUsesAttempt.fromJson(Map<String, dynamic> json) =>
      GetAllUsesAttempt(
        count: json["count"] ?? 0,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        id: json["_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "date": date?.toIso8601String(),
    "_id": id,
  };
}
