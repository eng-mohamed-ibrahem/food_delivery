import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DismissbleWidget extends StatelessWidget {
  final void Function(DismissDirection)? onDismissed;
  final Key dismisskey;
  final Widget child;
  const DismissbleWidget(
      {super.key,
      required this.dismisskey,
      required this.child,
      this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismisskey,
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      dismissThresholds: const <DismissDirection, double>{
        DismissDirection.endToStart: 0.25,
      },
      background: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(251, 171, 32, 1)),
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Center(
                  child: FaIcon(
                FontAwesomeIcons.trashCan,
                color: Colors.white,
                size: 30,
              )),
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}
