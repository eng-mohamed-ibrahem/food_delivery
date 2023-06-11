import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countProvider = StateProvider.autoDispose<int>((ref) => 1);

class FoodWidget extends ConsumerWidget {
  final FoodModel foodModel;
  const FoodWidget({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context, ref) {

    
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(foodModel.foodPhoto),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(foodModel.foodName,
                          style:
                              Theme.of(context).listTileTheme.titleTextStyle),
                      subtitle: Text(
                        foodModel.restaurantName,
                        style:
                            Theme.of(context).listTileTheme.subtitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${foodModel.totalPrice} \$',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
