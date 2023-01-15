// To parse this JSON data, do
//
//     final homeListModel = homeListModelFromJson(jsonString);

import 'dart:convert';

import '../../../core/models/product_res_model.dart';

HomeListModel homeListModelFromJson(String str) => HomeListModel.fromJson(json.decode(str));

class HomeListModel {
  HomeListModel({
    required this.errorCode,
    required this.errorMsg,
    required this.data,
  });

  String? errorCode;
  String? errorMsg;
  List<Datum> data;

  factory HomeListModel.fromJson(Map<String, dynamic> json) => HomeListModel(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data: json["data"] == null
            ? []
            : json["data"] == null
                ? []
                : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.categoryDetail,
    required this.products,
  });

  List<CategoryDetail> categoryDetail;
  List<Product> products;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryDetail: json["category_detail"] == null
            ? []
            : json["category_detail"] == null
                ? []
                : List<CategoryDetail>.from(json["category_detail"]!.map((x) => CategoryDetail.fromJson(x))),
        products: json["products"] == null
            ? []
            : json["products"] == null
                ? []
                : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      );
}

class CategoryDetail {
  CategoryDetail({
    required this.id,
    required this.name,
  });

  int? id;
  String name;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        id: json["id"],
        name: json["name"] ?? "",
      );
}
