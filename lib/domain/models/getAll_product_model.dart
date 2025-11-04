import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
    final String message;
    final ProductListData data;
    final int status;
    final bool isSuccess;

    ProductListModel({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    ProductListModel copyWith({
        String? message,
        ProductListData? data,
        int? status,
        bool? isSuccess,
    }) => 
        ProductListModel(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        message: json["Message"],
        data: ProductListData.fromJson(json["Data"]),
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

class ProductListData {
    final List<ProductListDoc> docs;
    final int totalDocs;
    final int limit;
    final int totalPages;
    final int page;
    final int pagingCounter;
    final bool hasPrevPage;
    final bool hasNextPage;
    final dynamic prevPage;
    final dynamic nextPage;

    ProductListData({
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

    ProductListData copyWith({
        List<ProductListDoc>? docs,
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
        ProductListData(
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

    factory ProductListData.fromJson(Map<String, dynamic> json) => ProductListData(
        docs: List<ProductListDoc>.from(json["docs"].map((x) => ProductListDoc.fromJson(x))),
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

class ProductListDoc {
    final String id;
    final ProductListCategory? category;
    final String shortname;
    final String productname;
    final String image;
    final String tagno;
    final int gwt;
    final int nwt;
    final int dwt;
    final bool status;
    final DateTime createdAt;
    final String docId;

    ProductListDoc({
        required this.id,
        required this.category,
        required this.shortname,
        required this.productname,
        required this.image,
        required this.tagno,
        required this.gwt,
        required this.nwt,
        required this.dwt,
        required this.status,
        required this.createdAt,
        required this.docId,
    });

    ProductListDoc copyWith({
        String? id,
        ProductListCategory? category,
        String? shortname,
        String? productname,
        String? image,
        String? tagno,
        int? gwt,
        int? nwt,
        int? dwt,
        bool? status,
        DateTime? createdAt,
        String? docId,
    }) => 
        ProductListDoc(
            id: id ?? this.id,
            category: category ?? this.category,
            shortname: shortname ?? this.shortname,
            productname: productname ?? this.productname,
            image: image ?? this.image,
            tagno: tagno ?? this.tagno,
            gwt: gwt ?? this.gwt,
            nwt: nwt ?? this.nwt,
            dwt: dwt ?? this.dwt,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            docId: docId ?? this.docId,
        );

    factory ProductListDoc.fromJson(Map<String, dynamic> json) => ProductListDoc(
        id: json["_id"],
        category: json["category"] == null ? null : ProductListCategory.fromJson(json["category"]),
        shortname: json["shortname"],
        productname: json["productname"],
        image: json["image"],
        tagno: json["tagno"],
        gwt: json["gwt"],
        nwt: json["nwt"],
        dwt: json["dwt"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        docId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category?.toJson(),
        "shortname": shortname,
        "productname": productname,
        "image": image,
        "tagno": tagno,
        "gwt": gwt,
        "nwt": nwt,
        "dwt": dwt,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "id": docId,
    };
}

class ProductListCategory {
    final String id;
    final String parentid;
    final String name;
    final bool status;
    final DateTime createdAt;

    ProductListCategory({
        required this.id,
        required this.parentid,
        required this.name,
        required this.status,
        required this.createdAt,
    });

    ProductListCategory copyWith({
        String? id,
        String? parentid,
        String? name,
        bool? status,
        DateTime? createdAt,
    }) => 
        ProductListCategory(
            id: id ?? this.id,
            parentid: parentid ?? this.parentid,
            name: name ?? this.name,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
        );

    factory ProductListCategory.fromJson(Map<String, dynamic> json) => ProductListCategory(
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
