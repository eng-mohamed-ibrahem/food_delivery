import 'package:flutter/material.dart';
import 'package:food_delivery/contoller/utils/color_contsants.dart';

class ConfirmOrderItem extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget content;
  final void Function()? onPressed;
  const ConfirmOrderItem(
      {Key? key,
      required this.leading,
      required this.title,
      required this.content,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                onPressed != null
                    ? TextButton(
                        onPressed: onPressed,
                        child: const Text(
                          'Edit',
                          style:
                              TextStyle(color: ColorConstants.textButtonColor),
                        ))
                    : const SizedBox()
              ],
            ),
            ListTile(
              leading: leading,
              title: content,
            ),
          ],
        ),
      ),
    );
  }
}
