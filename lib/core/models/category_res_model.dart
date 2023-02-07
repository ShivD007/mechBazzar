// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModels? categoryModelFromJson(String str) => CategoryModels.fromJson(json.decode(str));

String categoryModelToJson(CategoryModels? data) => json.encode(data!.toJson());

class CategoryModels {
  CategoryModels({
    this.errorCode,
    this.errorMsg,
    required this.data,
  });

  String? errorCode;
  String? errorMsg;
  List<CategoryModel> data;

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data: json["data"] == null ? [] : List<CategoryModel>.from(json["data"]!.map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMsg": errorMsg,
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    this.slug,
    this.status,
    this.scrapUrl,
    this.scrapStatus,
    this.photo,
    this.isFeatured,
    this.image,
  });

  int id;
  int categoryId;
  String name;
  String? slug;
  int? status;
  String? scrapUrl;
  int? scrapStatus;
  dynamic photo;
  int? isFeatured;
  dynamic image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? 1,
        categoryId: json["category_id"] ?? 1,
        name: json["name"] ?? "",
        slug: json["slug"],
        status: json["status"],
        scrapUrl: json["scrap_url"],
        scrapStatus: json["scrap_status"],
        photo: json["photo"],
        isFeatured: json["is_featured"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "status": status,
        "scrap_url": scrapUrl,
        "scrap_status": scrapStatus,
        "photo": photo,
        "is_featured": isFeatured,
        "image": image,
      };
}
