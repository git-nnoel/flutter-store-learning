import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final List<BoxShadow> boxShadow;
  final Color? fill;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.fill,
    this.boxShadow = const <BoxShadow>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: (fill != null) ? fill! : const Color.fromARGB(255, 44, 44, 44),
            borderRadius: BorderRadius.circular(5),
            boxShadow: boxShadow),
        child: child);
  }
}
