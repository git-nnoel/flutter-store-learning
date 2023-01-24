import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Components/default_button.dart';

import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 48, 48, 48),
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          // Image.asset(
          //   "../assets/images/logo.png",
          //   height: 40,
          //   alignment: Alignment.topCenter,
          // ),
          const SizedBox(width: 5),
          Text(
            "logo".toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white, fontFamily: 'Montserrat'),
          ),
          const Spacer(),
          MenuItem(
            title: "Home",
            press: () {},
          ),
          MenuItem(
            title: "about",
            press: () {},
          ),
          MenuItem(
            title: "Support",
            press: () {},
          ),
          DefaultButton(
            text: "Get Started",
            press: () {Navigator.pushNamed(context, '/login');},
          ),
        ],
      ),
    );
  }
}
