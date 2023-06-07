import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:food_delivery/contoller/provider/orders_list_provider.dart';
import 'package:food_delivery/model/order_model.dart';
import 'food_widget.dart';

class PriceInfo extends ConsumerWidget {
  final Widget content;
  final void Function() onPressed;
  const PriceInfo({
    super.key,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, ref) {
    /// to notifiy me when user click on button and update price info and not updating all list
    ref.watch(countProvider);
    OrderModel orderDetailas = OrderModel(
        foodList: ref.watch(ordersListProvider),
        deliveryCharge: 2,
        discount: 1.2);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        // width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(49, 209, 128, 1),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub-Total',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${orderDetailas.subTotoal} \$',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Charge',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${orderDetailas.deliveryCharge} \$',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${orderDetailas.discount} \$',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const Divider(
              height: 8,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${orderDetailas.total} \$',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(254, 254, 255, 1),
                ),
              ),
              onPressed: onPressed,
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
