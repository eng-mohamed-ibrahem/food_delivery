import 'dart:convert';
import 'package:food_delivery/model/food_model.dart';

class OrderModel {
  List<FoodModel> foodList;
  double subTotoal = 0;
  double deliveryCharge;
  double discount;
  double total = 0;
  OrderModel({
    required this.foodList,
    required this.deliveryCharge,
    required this.discount,
  }) {
    for (var element in foodList) {
      subTotoal += element.totalPrice;
    }

    total = double.parse(
        (subTotoal + deliveryCharge + discount).toStringAsFixed(2));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodList': foodList.map((x) => x.toMap()).toList(),
      'subTotoal': subTotoal,
      'deliveryCharge': deliveryCharge,
      'discount': discount,
      'total': total,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      foodList: List<FoodModel>.from(
        (map['foodList'] as List<int>).map<FoodModel>(
          (x) => FoodModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      deliveryCharge: map['deliveryCharge'] as double,
      discount: map['discount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(orderList: $foodList, subTotoal: $subTotoal, deliveryCharge: $deliveryCharge, discount: $discount, total: $total)';
  }
}
