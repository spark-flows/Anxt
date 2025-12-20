import 'dart:convert';



DownloadInvoiceModel downloadInvoiceModelFromJson(String str) =>
    DownloadInvoiceModel.fromJson(json.decode(str));

String downloadInvoiceModelToJson(DownloadInvoiceModel data) =>
    json.encode(data.toJson());

class DownloadInvoiceModel {
  String? message;
  DownloadInvoiceData? data;
  int? status;
  bool? isSuccess;

  DownloadInvoiceModel({this.message, this.data, this.status, this.isSuccess});

  factory DownloadInvoiceModel.fromJson(Map<String, dynamic> json) =>
      DownloadInvoiceModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : DownloadInvoiceData.fromJson(json["Data"]),
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

class DownloadInvoiceData {
  String? pdfUrl;

  DownloadInvoiceData({this.pdfUrl});

  factory DownloadInvoiceData.fromJson(Map<String, dynamic> json) =>
      DownloadInvoiceData(pdfUrl: json["pdfUrl"]);

  Map<String, dynamic> toJson() => {"pdfUrl": pdfUrl};
}
