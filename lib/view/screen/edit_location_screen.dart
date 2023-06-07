import 'package:flutter/material.dart';

import '../../contoller/utils/color_contsants.dart';
import '../widget/confirm_order_item.dart';

class EditLocationScreen extends StatelessWidget {
  const EditLocationScreen({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const ConfirmOrderItem(
            title: Text(
              'Order Location',
              style: TextStyle(color: Color.fromRGBO(59, 59, 59, 1)),
            ),
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 225, 77, 1),
              child: Icon(
                Icons.location_on_outlined,
                size: 30,
                color: Color.fromRGBO(232, 109, 40, 1),
              ),
            ),
            content: Text(
              '8502 Preston Rd. Inglewood, Maine 98380',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: null,
          ),
          Column(
            children: [
              const ConfirmOrderItem(
                title: Text(
                  'Deliver To',
                  style: TextStyle(color: Color.fromRGBO(59, 59, 59, 1)),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 225, 77, 1),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Color.fromRGBO(232, 109, 40, 1),
                  ),
                ),
                content: Text(
                  '4517 Washington Ave. Manchester, Kentucky 39495',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: null,
              ),
              TextButton(
                  onPressed: () {
                    // move to location screen to set new location
                  },
                  child: const Text(
                    'Set Location',
                    style: TextStyle(color: ColorConstants.textButtonColor),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
