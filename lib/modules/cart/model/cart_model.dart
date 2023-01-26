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
      id: json["id"].toString(),
      qty: json["qty"].toString(),
      color: json["color"].toString(),
      size: json["size"].toString(),
      sizeQty: json["size_qty"].toString(),
      sizePrice: json["size_price"].toString(),
      sizeKey: json["size_key"].toString(),
    );
  }
}
