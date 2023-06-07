import 'package:flutter/material.dart';
import 'package:food_delivery/view/screen/payment.dart';
import '../widget/confirm_order_item.dart';
import '../widget/price_info.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Order',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ConfirmOrderItem(
              title: const Text(
                'Deliver To',
                style: TextStyle(color: Color.fromRGBO(59, 59, 59, 1)),
              ),
              leading: const CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 225, 77, 1),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Color.fromRGBO(232, 109, 40, 1),
                ),
              ),
              content: const Text(
                '4517 Washington Ave. Manchester, Kentucky 39495',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                
              },
            ),
            ConfirmOrderItem(
              title: const Text(
                'Payment Method',
                style: TextStyle(color: Color.fromRGBO(59, 59, 59, 1)),
              ),
              leading: Text.rich(
                const TextSpan(children: [
                  TextSpan(
                      text: 'Pay',
                      style: TextStyle(color: Color.fromRGBO(37, 59, 128, 1))),
                  TextSpan(
                      text: 'Pal',
                      style: TextStyle(color: Color.fromRGBO(23, 155, 215, 1))),
                ]),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              content: const Text(
                '2121 6352 8465 ****',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                /// navigate to payment methods screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Payment(),
                  ),
                );
              },
            ),
            const Spacer(),
            Center(
              child: PriceInfo(
                content: const Text(
                  'Confirm Order',
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
                  /// confirm payment
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
