import 'package:flutter/material.dart';
import 'package:food_delivery/view/screen/order_details.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../contoller/provider/orders_list_provider.dart';

/// fetch any pre_required data needed before going to home screen
class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future(() => ref.read(ordersListProvider.notifier).initializeProvider());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderDetails(),
                ),
              );
            },
            child: const Text('Go To Orderlist')),
      ),
    );
  }
}
