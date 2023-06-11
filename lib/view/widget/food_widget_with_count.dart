import 'package:flutter/material.dart';
import 'package:food_delivery/model/food_model.dart';
import 'package:food_delivery/view/widget/food_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countProvider = StateProvider.autoDispose<int>((ref) => 1);

class FoodWidgetWithCount extends ConsumerWidget {
  final FoodModel foodModel;
  const FoodWidgetWithCount({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(countProvider);

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
              FoodWidget(foodModel: foodModel),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    style: Theme.of(context).iconButtonTheme.style!.copyWith(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(235, 251, 243, 1))),
                    onPressed: () {
                      /// [foodModel.count] is previous count
                      foodModel.setCounts = foodModel.count - 1;
                      ref.watch(countProvider.notifier).state = foodModel.count;
                    },
                    icon: Icon(
                      Icons.remove,
                      size: Theme.of(context).iconTheme.size,
                      color: const Color.fromRGBO(21, 190, 119, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('${foodModel.count}'),
                  ),
                  IconButton(
                    style: Theme.of(context).iconButtonTheme.style!.copyWith(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(21, 190, 119, 1),
                          ),
                        ),
                    onPressed: () {
                      foodModel.setCounts = foodModel.count + 1;
                      ref
                          .watch(countProvider.notifier)
                          .update((state) => state + 1);
                    },
                    icon: Icon(
                      Icons.add,
                      size: Theme.of(context).iconTheme.size,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
