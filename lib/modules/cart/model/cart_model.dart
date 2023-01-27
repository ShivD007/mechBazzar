import 'dart:developer';

class Cart {
  Cart({
    required this.id,
    required this.qty,
    required this.color,
    required this.size,
    required this.sizeQty,
    required this.sizePrice,
    required this.sizeKey,
  });

  final String? id;
  final String? qty;
  final String? color;
  final String? size;
  final String? sizeQty;
  final String? sizePrice;
  final String? sizeKey;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json["id"] == null ? "" : json["id"].toString(),
      qty: json["qty"] == null ? "" : json["qty"].toString(),
      color: json["color"] == null ? "#241414" : json["color"].toString(),
      size: json["size"] == null ? "S" : json["size"].toString(),
      sizeQty: json["size_qty"] == null ? json["qty"].toString() : json["size_qty"].toString(),
      sizePrice: json["size_price"] == null ? json["price"].toString() : json["size_price"].toString(),
      sizeKey: json["size_key"] == null ? "1" : json["size_key"].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "color": color,
        "size": size,
        "size_qty": sizeQty,
        "size_price": sizePrice,
        "size_key": sizeKey,
      };
}
