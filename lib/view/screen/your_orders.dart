import 'package:flutter/material.dart';
import 'package:food_delivery/view/screen/set_location_screen.dart';
import 'package:food_delivery/view/widget/food_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../contoller/provider/orders_list_provider.dart';
import '../../model/food_model.dart';
import '../widget/search_bar.dart';

class YourOrders extends ConsumerWidget {
  YourOrders({super.key});
  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    /// change
    List<FoodModel> foods = ref.watch(ordersListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Find Your Favorite Food',
                    style: Theme.of(context).textTheme.headlineLarge),
                Badge(
                  label: const CircleAvatar(
                    radius: 3,
                    backgroundColor: Color.fromRGBO(255, 69, 69, 1),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // go ot notification screen
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomSearchBar(
                  hintText: 'What do you want to order?',
                  textEditingController: searchEditingController,
                ),
                const Spacer(),
                IconButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort,
                      color: Color.fromRGBO(218, 99, 23, 1),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      FoodWidget(
                        foodModel: foods[index],
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(21, 190, 119, 1),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Processed',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromRGBO(21, 190, 119, 1),
                ),
              ),
              onPressed: () {
                // navigate to location screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationScreen(),
                  ),
                );
              },
              child: const Text(
                'Check Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
