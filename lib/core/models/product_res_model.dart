// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList? productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList? data) => json.encode(data!.toJson());

class ProductList {
  ProductList({
    this.errorCode,
    this.errorMsg,
    required this.data,
  });

  String? errorCode;
  String? errorMsg;
  List<Product> data;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data: json["data"] == null ? [] : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMsg": errorMsg,
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    this.sku,
    this.affiliateLink,
    this.userId,
    this.categoryId,
    this.subcategoryId,
    this.childcategoryId,
    this.attributes,
    this.name,
    this.slug,
    this.photo,
    this.thumbnail,
    this.file,
    this.size,
    this.sizeQty,
    this.sizePrice,
    this.color,
    required this.price,
    required this.previousPrice,
    this.details,
    this.stock,
    this.policy,
    this.status,
    this.scrapUrl,
    this.scrapStatus,
    this.scrapId,
    this.scrapJson,
    this.views,
    this.tags,
    this.features,
    this.colors,
    this.productCondition,
    this.ship,
    this.isMeta,
    this.metaTag,
    this.metaDescription,
    this.youtube,
    this.type,
    this.license,
    this.licenseQty,
    this.link,
    this.platform,
    this.region,
    this.licenceType,
    this.measure,
    this.featured,
    this.best,
    this.top,
    this.hot,
    this.latest,
    this.big,
    this.trending,
    this.sale,
    this.createdAt,
    this.isDiscount,
    this.discountDate,
    this.wholeSellQty,
    this.wholeSellDiscount,
    this.isCatalog,
    this.catalogId,
    this.tax,
    this.showFront,
    this.brandId,
    this.gallery,
    this. qty
  });

  int id;
  String? sku;
  dynamic affiliateLink;
  int? userId;
  int? categoryId;
  int? subcategoryId;
  int? childcategoryId;
  dynamic attributes;
  String? name;
  String? slug;
  String? photo;
  String? thumbnail;
  dynamic file;
  dynamic size;
  dynamic sizeQty;
  dynamic sizePrice;
  dynamic color;
  num price;
  num previousPrice;
  String? details;
  dynamic stock;
  dynamic policy;
  int? status;
  String? scrapUrl;
  int? scrapStatus;
  String? scrapId;
  String? scrapJson;
  int? views;
  dynamic tags;
  dynamic features;
  dynamic colors;
  int? productCondition;
  dynamic ship;
  int? isMeta;
  dynamic metaTag;
  dynamic metaDescription;
  dynamic youtube;
  Type? type;
  dynamic license;
  dynamic licenseQty;
  dynamic link;
  dynamic platform;
  dynamic region;
  dynamic licenceType;
  dynamic measure;
  int? featured;
  int? best;
  int? top;
  int? hot;
  int? latest;
  int? big;
  int? trending;
  int? sale;
  dynamic createdAt;
  int? isDiscount;
  dynamic discountDate;
  dynamic wholeSellQty;
  dynamic wholeSellDiscount;
  int? isCatalog;
  int? catalogId;
  dynamic tax;
  int? showFront;
  String? brandId;
  List<String?>? gallery;
  int? qty;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        sku: json["sku"],
        affiliateLink: json["affiliate_link"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        childcategoryId: json["childcategory_id"],
        attributes: json["attributes"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        thumbnail: json["thumbnail"],
        file: json["file"],
        size: json["size"],
        sizeQty: json["size_qty"],
        sizePrice: json["size_price"],
        color: json["color"],
        price: json["price"] ?? 0,
        previousPrice: json["previous_price"] ?? 0,
        details: json["details"],
        stock: json["stock"],
        policy: json["policy"],
        status: json["status"],
        scrapUrl: json["scrap_url"],
        scrapStatus: json["scrap_status"],
        scrapId: json["scrap_id"],
        scrapJson: json["scrap_json"],
        views: json["views"],
        tags: json["tags"],
        features: json["features"],
        colors: json["colors"],
        productCondition: json["product_condition"],
        ship: json["ship"],
        isMeta: json["is_meta"],
        metaTag: json["meta_tag"],
        metaDescription: json["meta_description"],
        youtube: json["youtube"],
        license: json["license"],
        licenseQty: json["license_qty"],
        link: json["link"],
        platform: json["platform"],
        region: json["region"],
        licenceType: json["licence_type"],
        measure: json["measure"],
        featured: json["featured"],
        best: json["best"],
        top: json["top"],
        hot: json["hot"],
        latest: json["latest"],
        big: json["big"],
        trending: json["trending"],
        sale: json["sale"],
        createdAt: json["created_at"],
        isDiscount: json["is_discount"],
        discountDate: json["discount_date"],
        wholeSellQty: json["whole_sell_qty"],
        wholeSellDiscount: json["whole_sell_discount"],
        isCatalog: json["is_catalog"],
        catalogId: json["catalog_id"],
        tax: json["tax"],
        showFront: json["show_front"],
        brandId: json["brand_id"],
        qty: json["qty"],
        gallery: json["gallery"] == null ? [] : List<String?>.from(json["gallery"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "affiliate_link": affiliateLink,
        "user_id": userId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "childcategory_id": childcategoryId,
        "attributes": attributes,
        "name": name,
        "slug": slug,
        "photo": photo,
        "thumbnail": thumbnail,
        "file": file,
        "size": size,
        "size_qty": sizeQty,
        "size_price": sizePrice,
        "color": color,
        "price": price,
        "previous_price": previousPrice,
        "details": details,
        "stock": stock,
        "policy": policy,
        "status": status,
        "scrap_url": scrapUrl,
        "scrap_status": scrapStatus,
        "scrap_id": scrapId,
        "scrap_json": scrapJson,
        "views": views,
        "tags": tags,
        "features": features,
        "colors": colors,
        "product_condition": productCondition,
        "ship": ship,
        "is_meta": isMeta,
        "meta_tag": metaTag,
        "meta_description": metaDescription,
        "youtube": youtube,
        "type": typeValues.reverse![type],
        "license": license,
        "license_qty": licenseQty,
        "link": link,
        "platform": platform,
        "region": region,
        "licence_type": licenceType,
        "measure": measure,
        "featured": featured,
        "best": best,
        "top": top,
        "hot": hot,
        "latest": latest,
        "big": big,
        "trending": trending,
        "sale": sale,
        "created_at": createdAt,
        "is_discount": isDiscount,
        "discount_date": discountDate,
        "whole_sell_qty": wholeSellQty,
        "whole_sell_discount": wholeSellDiscount,
        "is_catalog": isCatalog,
        "catalog_id": catalogId,
        "tax": tax,
        "show_front": showFront,
        "brand_id": brandId, 
        "qty": qty, 
        "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x)),
      };
}

enum ProductType { NORMAL }

final productTypeValues = EnumValues({"normal": ProductType.NORMAL});

enum Type { PHYSICAL }

final typeValues = EnumValues({"Physical": Type.PHYSICAL});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
