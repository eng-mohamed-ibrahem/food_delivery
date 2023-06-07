import 'dart:convert';

class FoodModel {
  final String foodPhoto;
  final String foodName;
  final String restaurantName;
  final double price;
  double totalPrice;
  int count;
  FoodModel(
      {required this.foodPhoto,
      required this.foodName,
      required this.restaurantName,
      required this.price,
      this.count = 1})
      : totalPrice = price * count;

  /// to manage counts
  set setCounts(int counts) {
    if (counts >= 1) {
      count = counts;
      totalPrice = double.parse((price * count).toStringAsFixed(2));
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodPhoto': foodPhoto,
      'foodName': foodName,
      'restaurantName': restaurantName,
      'price': price,
      'count': count,
      'totalPrice': totalPrice
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      foodPhoto: map['foodPhoto'] as String,
      foodName: map['foodName'] as String,
      restaurantName: map['restaurantName'] as String,
      price: map['price'] as double,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) =>
      FoodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodModel(foodPhoto: $foodPhoto, foodName: $foodName, restaurantName: $restaurantName, price: $price, totalPrice: $totalPrice, count: $count)';
  }
}
