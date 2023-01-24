import 'package:flutter/material.dart';

class RoundedButtonContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final List<BoxShadow> boxShadow;
  const RoundedButtonContainer(
      {Key? key,
      required this.child,
      this.height,
      this.width,
      this.boxShadow = const <BoxShadow>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (height != null) ? height! : 38,
        width: (width != null) ? width! : 90,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(5),
          boxShadow: boxShadow,
        ),
        child: child);
  }
}
