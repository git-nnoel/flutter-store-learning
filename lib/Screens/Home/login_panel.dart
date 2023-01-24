import 'dart:math';
import 'package:flutter/material.dart';
import '../Components/button_options.dart';
import '../Components/password_field_options.dart';
import '../Components/text_field_options.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (Container(
        alignment: Alignment.center,
        height: 380,
        width: min(max(size.width * 0.5, 310), 480),
        margin: EdgeInsetsDirectional.only(
            top: (MediaQuery.of(context).size.height - 380) / 2 - 60),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 48, 48),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.5),
              ),
            ]),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          RoundedTextFieldComponent(
            top: 40,
            width: min(max(size.width * 0.5, 310), 480) - 100,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(140, 20, 20, 20),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0))
            ],
            label: "username",
            icon: const Icon(Icons.person),
            onChanged: (value) {},
          ),
          //const SizedBox(height: 5),
          RoundedPassFieldComponent(
            top: 95,
            width: min(max(size.width * 0.5, 310), 480) - 100,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(140, 20, 20, 20),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0))
            ],
            label: "password",
            onChanged: (value) {},
          ),
          //const SizedBox(height: 25),
          RoundedButtonComponent(
            top: 170,
            height: 32,
            width: 95,
            label: "log in",
            icon: const Icon(
              Icons.login,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/catalog');
            },
            fill: const Color.fromARGB(255, 224, 203, 7),
            hoverFill: const Color.fromARGB(255, 196, 177, 10),
            pressedFill: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 20, 20, 20),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0))
            ],
          ),
          RoundedButtonComponent(
            top: 215,
            height: 32,
            width: 95,
            label: "register here",
            onPressed: () {
              Navigator.pushNamed(context, '/signup/');
            },
            fill: const Color.fromARGB(255, 48, 48, 48),
            hoverFill: const Color.fromARGB(255, 48, 48, 48),
            pressedFill: const Color.fromARGB(255, 48, 48, 48),
            hoverColor: const Color.fromARGB(255, 224, 203, 7),
          ),
        ])));
  }
}
