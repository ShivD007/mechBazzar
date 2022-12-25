class CategoryResModel {
  CategoryResModel({
    required this.id,
    required this.count,
    required this.name,
    required this.slug,
    required this.code,
    required this.msg,
  });

  final int? id;
  final int? count;
  final String? name;
  final String slug;
  final String? code;
  final String? msg;

  factory CategoryResModel.fromJson(Map<String, dynamic> json) =>
      CategoryResModel(
          id: json["id"],
          count: json["count"],
          name: json["name"],
          slug: json["slug"],
          code: json["code"],
          msg: json["message"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "name": name,
        "slug": slug,
        "message": msg,
        "code": code
      };
}
