import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/food_model.dart';
import '../shared_helper/shared_helper.dart';
import '../utils/app_constants.dart';

final ordersListProvider =
    StateNotifierProvider<_OrdersListNotifier, List<FoodModel>>(
  (ref) => _OrdersListNotifier([]),
);

class _OrdersListNotifier extends StateNotifier<List<FoodModel>> {
  _OrdersListNotifier(super.state);

  /// fetch data from shared
  initializeProvider() {
    state = foods;
    // state =
    //     SharedHelper.getListFromShared(key: AppConstanst.ordersListKeyInShared)
    //         .toList();
  }

  


  addFoodItem(FoodModel item) {
    state.add(item);
    state = [...state];
  }

  removeFoodItem(FoodModel item) {
    state.remove(item);
    state = [...state];
  }

  Future<bool> saveOrdersListInShared() async {
    return await SharedHelper.saveListToShared(
        key: AppConstanst.ordersListKeyInShared, values: state);
  }
}

var foods = <FoodModel>[
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 5),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 3),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 12),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 9),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 14),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 3.4),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 7.2),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 5),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 11),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 14),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 23),
  FoodModel(
      foodPhoto: 'assets/images/menu_photo.png',
      foodName: "foodName",
      restaurantName: "restaurantName",
      price: 18),
];
