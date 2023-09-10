import 'dart:convert';

class ProductModel {
  int id;
  int price;
  String name;
  String makerCompany;
  String sizes;
  String colors;
  String discription;
  String imgUrl;
  int disCount;
  String date;
  ProductModel(
      {required this.imgUrl,
      required this.name,
      required this.makerCompany,
      required this.sizes,
      required this.colors,
      required this.discription,
      required this.id,
      required this.price,
      required this.date,
      required this.disCount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'disCount': disCount,
      'imgUrl': imgUrl,
      'id': id,
      'price': price,
      'name': name,
      'makerCompany': makerCompany,
      'sizes': sizes,
      'colors': colors,
      'discription': discription,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      date: map['date'] as String,
      disCount: map['discount'] as int,
      imgUrl: map['imgUrl'] as String,
      id: map['id'] as int,
      price: map['price'] as int,
      name: map['name'] as String,
      makerCompany: map['makerCompany'] as String,
      sizes: map['sizes'] as String,
      colors: map['colors'] as String,
      discription: map['discription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
