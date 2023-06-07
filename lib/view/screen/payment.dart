import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

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
            'Payment',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: Text('PayPal'),
                title: Text('2121 6352 8465 ****'),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: Text('Visa'),
                title: Text('2121 6352 8465 ****'),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const ListTile(
                leading: Text('Payoneer'),
                title: Text('2121 6352 8465 ****'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
