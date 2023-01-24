import 'package:flutter/material.dart';

import 'button_container.dart';

class RoundedButtonComponent extends StatefulWidget {
  final Icon icon;
  final String label;
  final Alignment? iconAlignment;
  final Alignment? labelAlignment;
  final Color color;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? disabledColor;
  final Color fill;
  final Color hoverFill;
  final Color pressedFill;
  final Color disabledFill;
  final bool isDisabled;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final List<BoxShadow> boxShadow;
  const RoundedButtonComponent({
    Key? key,
    this.icon = const Icon(
      Icons.add,
      color: Color.fromARGB(0, 255, 255, 255),
    ),
    required this.label,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 255, 255, 255),
    this.hoverColor,
    this.pressedColor,
    this.disabledColor = const Color.fromARGB(255, 110, 110, 110),
    this.fill = const Color.fromARGB(0, 255, 255, 255),
    this.hoverFill = const Color.fromARGB(120, 255, 255, 255),
    this.pressedFill = const Color.fromARGB(255, 255, 255, 255),
    this.disabledFill = const Color.fromARGB(255, 163, 163, 163),
    this.isDisabled = false,
    this.height,
    this.width,
    this.boxShadow = const <BoxShadow>[],
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.iconAlignment,
    this.labelAlignment,
  }) : super(key: key);

  @override
  State<RoundedButtonComponent> createState() => _RoundedButtonComponent();
}

class _RoundedButtonComponent extends State<RoundedButtonComponent>{

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.top,
        left: widget.left,
        right: widget.right,
        bottom: widget.bottom,
        child: RoundedButtonContainer(
            height: widget.height,
            width: widget.width,
            boxShadow: widget.boxShadow,
            child: TextButton(
                onPressed: (widget.isDisabled) ? () => {} : widget.onPressed,
                style: ButtonStyle(foregroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return (widget.isDisabled)
                        ? widget.disabledColor
                        : (widget.pressedColor == null)
                            ? widget.color
                            : widget.pressedColor;
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return (widget.isDisabled)
                        ? widget.disabledColor
                        : (widget.hoverColor == null)
                            ? widget.color
                            : widget.hoverColor;
                  }
                  return (widget.isDisabled) ? widget.disabledColor : widget.color;
                }), textStyle: MaterialStateProperty.resolveWith((states) {
                  return const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500);
                }), backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return (widget.isDisabled) ? widget.disabledFill : widget.pressedFill;
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return (widget.isDisabled) ? widget.disabledFill : widget.hoverFill;
                  }
                  return (widget.isDisabled) ? widget.disabledFill : widget.fill;
                })),
                child: Stack(children: [
                  Align(
                    alignment: (widget.iconAlignment != null)
                        ? widget.iconAlignment!
                        : Alignment.centerLeft,
                    child: widget.icon,
                  ),
                  Align(
                      alignment: (widget.labelAlignment != null)
                          ? widget.labelAlignment!
                          : Alignment.centerRight,
                      child: Text(widget.label)),
                ]))));
  }
}
