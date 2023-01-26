class RazarpayOder {
  RazarpayOder({
    required this.errorCode,
    required this.errorMsg,
    required this.data,
  });

  final String? errorCode;
  final String? errorMsg;
  final Data? data;

  factory RazarpayOder.fromJson(Map<String, dynamic> json) {
    return RazarpayOder(
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.entity,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    required this.receipt,
    required this.offerId,
    required this.status,
    required this.attempts,
    required this.notes,
    required this.createdAt,
  });

  final String? id;
  final String? entity;
  final int? amount;
  final int? amountPaid;
  final int? amountDue;
  final String? currency;
  final dynamic receipt;
  final dynamic offerId;
  final String? status;
  final int? attempts;
  final List<dynamic> notes;
  final int? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      entity: json["entity"],
      amount: json["amount"],
      amountPaid: json["amount_paid"],
      amountDue: json["amount_due"],
      currency: json["currency"],
      receipt: json["receipt"],
      offerId: json["offer_id"],
      status: json["status"],
      attempts: json["attempts"],
      notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
      createdAt: json["created_at"],
    );
  }
}
