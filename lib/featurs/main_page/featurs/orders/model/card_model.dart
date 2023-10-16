import 'dart:convert';

class CardModel {
  final String orderNumber;
  final String orderDate;
  final String dueDate;
  final int quantity;
  final int subtotal;
  final String trackingNumber;
  final bool isDelevered;
  CardModel(
      {required this.quantity,
      required this.subtotal,
      required this.trackingNumber,
      required this.orderNumber,
      required this.orderDate,
      required this.isDelevered,
      required this.dueDate});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderNumber': orderNumber,
      'orderDate': orderDate,
      'dueDate': dueDate,
      'quantity': quantity,
      'subtotal': subtotal,
      'trackingNumber': trackingNumber,
      'isDelevered': isDelevered,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      orderNumber: map['orderNumber'] as String,
      orderDate: map['orderDate'] as String,
      dueDate: map['dueDate'] as String,
      quantity: map['quantity'] as int,
      subtotal: map['subtotal'] as int,
      trackingNumber: map['trackingNumber'] as String,
      isDelevered: map['isDelevered'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
