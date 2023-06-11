import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery/contoller/provider/orders_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/food_model.dart';
import '../widget/dismissible_widget.dart';
import '../widget/food_widget_with_count.dart';
import '../widget/price_info.dart';
import 'confirm_order_screen.dart';

class OrderDetails extends ConsumerWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<FoodModel> foods = ref.watch(ordersListProvider);

    log('inside orderList');

    return WillPopScope(
      onWillPop: () async {
        await ref.read(ordersListProvider.notifier).saveOrdersListInShared();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: foods.isEmpty
            ? const Center(
                child: Text('make order to displaed here'),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order details',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Expanded(
                      child: ListView.builder(
                        clipBehavior: Clip.antiAlias,
                        itemCount: foods.length, // dummy
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DismissbleWidget(
                            dismisskey: Key('${foods[index]}'),
                            child: FoodWidgetWithCount(foodModel: foods[index]),
                            onDismissed: (direction) {
                              ref
                                  .watch(ordersListProvider.notifier)
                                  .removeFoodItem(foods[index]);
                            },
                          );
                        },
                      ),
                    ),
                    Center(
                      child: PriceInfo(
                        content: const Text(
                          'Place my order',
                          style: TextStyle(
                              color: Color.fromRGBO(
                                21,
                                190,
                                119,
                                1,
                              ),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConfirmOrder(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
