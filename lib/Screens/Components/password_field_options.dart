import 'package:flutter/material.dart';
import 'input_field_container.dart';

class RoundedPassFieldComponent extends StatefulWidget {
  final Icon icon;
  final String label;
  final ValueChanged<String> onChanged;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final Color? fill;
  final List<BoxShadow> boxShadow;

  const RoundedPassFieldComponent({
    Key? key,
    this.icon = const Icon(Icons.lock),
    required this.label,
    required this.onChanged,
    this.fill,
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
          color: Color.fromARGB(255, 20, 20, 20),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(0, 0))
    ],
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.width = 200,
  }) : super(key: key);

  @override
  State<RoundedPassFieldComponent> createState() =>
      _RoundedPassFieldComponent();
}

class _RoundedPassFieldComponent extends State<RoundedPassFieldComponent> {
  bool _obscurePassVar = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: widget.width,
        top: widget.top,
        left: widget.left,
        right: widget.right,
        bottom: widget.bottom,
        child: TextFieldContainer(
            fill: widget.fill,
            boxShadow: widget.boxShadow,
            child: TextField(
              obscureText: _obscurePassVar,
              strutStyle: const StrutStyle(height: 1),
              style: const TextStyle(
                  color: Color.fromARGB(255, 221, 221, 221),
                  fontSize: 14,
                  height: null),
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 221, 221, 221)),
                floatingLabelStyle:
                    const TextStyle(color: Color.fromARGB(255, 160, 160, 160)),
                prefixIconColor: const Color.fromARGB(255, 160, 160, 160),
                focusColor: const Color.fromARGB(255, 255, 251, 0),
                border: InputBorder.none,
                prefixIcon: widget.icon,
                labelText: widget.label,
                isDense: true,
                contentPadding: const EdgeInsets.only(
                    left: 6, top: 6, right: 6, bottom: 12),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassVar = !_obscurePassVar;
                    });
                  },
                  child: Icon(_obscurePassVar
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                suffixIconColor: const Color.fromARGB(255, 160, 160, 160),
              ),
            )));
  }
}
