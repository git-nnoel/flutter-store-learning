import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        onPressed: press,
        child: Text(
          style: const TextStyle(color: Color.fromARGB(255, 224, 203, 7)),
          text.toUpperCase(),
        ),
      ),
    );
  }
}
