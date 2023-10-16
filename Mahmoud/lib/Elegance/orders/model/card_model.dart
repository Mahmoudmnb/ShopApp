
class CardModel {
  final String numb;
  final DateTime orderDate;
  final DateTime dueDate;
  final int Quantity;
  final int Subtotal;
  final String TrackingNumber;
  final String KingOfOrder;
  CardModel(
      {required this.Quantity,
      required this.Subtotal,
      required this.TrackingNumber,
      required this.numb,
      required this.orderDate,
      required this.KingOfOrder,
      required this.dueDate});
}