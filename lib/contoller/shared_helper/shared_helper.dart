import 'package:food_delivery/model/food_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late SharedPreferences sharedPref;

  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveListToShared(
      {required String key, required List<FoodModel> values}) async {
    var stringList = <String>[];
    for (var item in values) {
      stringList.add(item.toJson());
    }
    return await sharedPref.setStringList(key, stringList);
  }

  static Iterable<FoodModel> getListFromShared({required String key}) sync* {
    if (sharedPref.containsKey(key)) {
      List<String>? stringList = sharedPref.getStringList(key);
      for (String item in stringList!) {
        yield FoodModel.fromJson(item);
      }
    }
  }
}
