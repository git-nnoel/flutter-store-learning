import 'package:flutter/material.dart';

import '../../Model/product.dart';

class InteractableGridItems extends StatelessWidget {
  const InteractableGridItems({
    super.key,
    required AnimationController controller,
    required Animation animation,
    required Product item,
  })  : _controller = controller,
        _animation = animation,
        _item = item;

  final AnimationController _controller;
  final Animation _animation;
  final Product _item;

  @override
  Widget build(BuildContext context) {
    Product? hoveredProduct;
    return InkWell(
        onTap: () {},
        onHover: (value) {
          if (value) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          (value) ? hoveredProduct = _item : hoveredProduct = null;
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: (hoveredProduct == _item) ? _animation.value : 1,
              child: AnimatedBuilder(
                animation: _controller,
                child: Image.asset(_item.image),
                builder: (context, child) {
                  return Transform.scale(
                    scale: (hoveredProduct == _item) ? _animation.value : 1,
                    child: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.center, children: [
                          Image.asset(_item.image,
                              scale: 2.5,
                              width: 200,
                              height: 200,
                              fit: (hoveredProduct == _item)
                                  ? BoxFit.none
                                  : BoxFit.fill),
                          Container(
                              width: 180,
                              height: 180,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(131, 0, 0, 0)
                                    ]),
                                color: Color.fromARGB(
                                    (hoveredProduct == _item) ? 185 : 105,
                                    0,
                                    0,
                                    0)),
                          ),
                          Text(
                            _item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          )
                        ])),
                  );
                },
              ),
            );
          },
        ));
  }
}