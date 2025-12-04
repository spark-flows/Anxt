import 'dart:convert';

GetOneCatelog getOneCatelogFromJson(String str) => GetOneCatelog.fromJson(json.decode(str));

String getOneCatelogToJson(GetOneCatelog data) => json.encode(data.toJson());

class GetOneCatelog {
    final String message;
    final GetOneCatelogData data;
    final int status;
    final bool isSuccess;

    GetOneCatelog({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    GetOneCatelog copyWith({
        String? message,
        GetOneCatelogData? data,
        int? status,
        bool? isSuccess,
    }) => 
        GetOneCatelog(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory GetOneCatelog.fromJson(Map<String, dynamic> json) => GetOneCatelog(
        message: json["Message"],
        data: GetOneCatelogData.fromJson(json["Data"]),
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

class GetOneCatelogData {
    final List<GetOneCatelogDoc> docs;
    final int totalDocs;
    final int limit;
    final int totalPages;
    final int page;
    final int pagingCounter;
    final bool hasPrevPage;
    final bool hasNextPage;
    final dynamic prevPage;
    final dynamic nextPage;

    GetOneCatelogData({
        required this.docs,
        required this.totalDocs,
        required this.limit,
        required this.totalPages,
        required this.page,
        required this.pagingCounter,
        required this.hasPrevPage,
        required this.hasNextPage,
        required this.prevPage,
        required this.nextPage,
    });

    GetOneCatelogData copyWith({
        List<GetOneCatelogDoc>? docs,
        int? totalDocs,
        int? limit,
        int? totalPages,
        int? page,
        int? pagingCounter,
        bool? hasPrevPage,
        bool? hasNextPage,
        dynamic prevPage,
        dynamic nextPage,
    }) => 
        GetOneCatelogData(
            docs: docs ?? this.docs,
            totalDocs: totalDocs ?? this.totalDocs,
            limit: limit ?? this.limit,
            totalPages: totalPages ?? this.totalPages,
            page: page ?? this.page,
            pagingCounter: pagingCounter ?? this.pagingCounter,
            hasPrevPage: hasPrevPage ?? this.hasPrevPage,
            hasNextPage: hasNextPage ?? this.hasNextPage,
            prevPage: prevPage ?? this.prevPage,
            nextPage: nextPage ?? this.nextPage,
        );

    factory GetOneCatelogData.fromJson(Map<String, dynamic> json) => GetOneCatelogData(
        docs: List<GetOneCatelogDoc>.from(json["docs"].map((x) => GetOneCatelogDoc.fromJson(x))),
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
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
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

class GetOneCatelogDoc {
    final String id;
    final GetOneCatelogCategory category;
    final String shortname;
    final String productname;
    final String image;
    final String tagno;
    final double gwt;
    final double nwt;
    final int dwt;
    final dynamic owt;
    final bool status;
    final DateTime createdAt;
    final String designno;
    final String kt;
    final String docId;

    GetOneCatelogDoc({
        required this.id,
        required this.category,
        required this.shortname,
        required this.productname,
        required this.image,
        required this.tagno,
        required this.gwt,
        required this.nwt,
        required this.dwt,
        required this.owt,
        required this.status,
        required this.createdAt,
        required this.designno,
        required this.kt,
        required this.docId,
    });

    GetOneCatelogDoc copyWith({
        String? id,
        GetOneCatelogCategory? category,
        String? shortname,
        String? productname,
        String? image,
        String? tagno,
        double? gwt,
        double? nwt,
        int? dwt,
        dynamic owt,
        bool? status,
        DateTime? createdAt,
        String? designno,
        String? kt,
        String? docId,
    }) => 
        GetOneCatelogDoc(
            id: id ?? this.id,
            category: category ?? this.category,
            shortname: shortname ?? this.shortname,
            productname: productname ?? this.productname,
            image: image ?? this.image,
            tagno: tagno ?? this.tagno,
            gwt: gwt ?? this.gwt,
            nwt: nwt ?? this.nwt,
            dwt: dwt ?? this.dwt,
            owt: owt ?? this.owt,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            designno: designno ?? this.designno,
            kt: kt ?? this.kt,
            docId: docId ?? this.docId,
        );

    factory GetOneCatelogDoc.fromJson(Map<String, dynamic> json) => GetOneCatelogDoc(
        id: json["_id"],
        category: GetOneCatelogCategory.fromJson(json["category"]),
        shortname: json["shortname"],
        productname: json["productname"],
        image: json["image"],
        tagno: json["tagno"],
        gwt: json["gwt"]?.toDouble(),
        nwt: json["nwt"]?.toDouble(),
        dwt: json["dwt"],
        owt: json["owt"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        designno: json["designno"],
        kt: json["kt"],
        docId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category.toJson(),
        "shortname": shortname,
        "productname": productname,
        "image": image,
        "tagno": tagno,
        "gwt": gwt,
        "nwt": nwt,
        "dwt": dwt,
        "owt": owt,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "designno": designno,
        "kt": kt,
        "id": docId,
    };
}

class GetOneCatelogCategory {
    final String id;
    final String parentid;
    final String name;
    final bool status;
    final DateTime createdAt;

    GetOneCatelogCategory({
        required this.id,
        required this.parentid,
        required this.name,
        required this.status,
        required this.createdAt,
    });

    GetOneCatelogCategory copyWith({
        String? id,
        String? parentid,
        String? name,
        bool? status,
        DateTime? createdAt,
    }) => 
        GetOneCatelogCategory(
            id: id ?? this.id,
            parentid: parentid ?? this.parentid,
            name: name ?? this.name,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
        );

    factory GetOneCatelogCategory.fromJson(Map<String, dynamic> json) => GetOneCatelogCategory(
        id: json["_id"],
        parentid: json["parentid"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "parentid": parentid,
        "name": name,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
    };
}
