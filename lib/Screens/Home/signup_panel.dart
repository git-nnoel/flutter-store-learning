import 'dart:math';
import 'package:flutter/material.dart';
import '../../Model/user.dart';
import 'package:flutter_application_2/transition.dart';

import '../../../responsive_media_query.dart';
import '../Components/button_options.dart';
import '../Components/password_field_options.dart';
import '../Components/text_field_options.dart';

class SignUpPanel extends StatefulWidget {
  final String fullname = '';
  final String pass1 = '';
  final String pass2 = '';
  final String passFinal = '';
  const SignUpPanel({super.key});

  @override
  State<SignUpPanel> createState() => _SignUpPanel();
}

class _SignUpPanel extends State<SignUpPanel> {
  String userFullname = '';
  String userPassword1 = '';
  String userPassword2 = '';
  String userFinalPassword = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: max(size.height - 180, 480),
        alignment: Alignment.center,
        child: AspectRatio(
            aspectRatio: 2.0 / 3.0,
            child: Container(
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
              child: Stack(alignment: Alignment.topCenter, children: <Widget>[
                Positioned(
                  top: 20,
                  child: Image.asset(
                      height: 90,
                      width: 90,
                      filterQuality: FilterQuality.high,
                      "../assets/images/logo.png"),
                ),
                const Positioned(
                  top: 130,
                  child: Text(
                    'create account',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                RoundedTextFieldComponent(
                  top: 215,
                  width: max(size.height - 180, 480) * 0.667 - 110,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(140, 20, 20, 20),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                  label: "full name",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    setState(() => {userFullname = value});
                  },
                ),
                RoundedPassFieldComponent(
                  top: 270,
                  width: max(size.height - 180, 480) * 0.667 - 110,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(140, 20, 20, 20),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                  label: "password",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    setState(() {
                      userPassword1 = value;
                      (userPassword1 == userPassword2)
                          ? userFinalPassword = value
                          : userFinalPassword = '';
                    });
                  },
                ),
                RoundedPassFieldComponent(
                  top: 325,
                  width: max(size.height - 180, 480) * 0.667 - 110,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(140, 20, 20, 20),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                  label: "confirm password",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    setState(() {
                      userPassword2 = value;
                      (userPassword1 == userPassword2)
                          ? userFinalPassword = value
                          : userFinalPassword = '';
                    });
                  },
                ),
                RoundedButtonComponent(
                  key: UniqueKey(),
                  top: 405,
                  height: 42,
                  width: 120,
                  label: "next step",
                  icon: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(createRoute(
                        begin: const Offset(1.0, 0.0),
                        query: SignUp2Query(
                          user: User(
                              fullName: userFullname,
                              password: userFinalPassword),
                        )));
                  },
                  isDisabled: userFinalPassword.isEmpty || userFullname.isEmpty,
                  disabledFill: const Color.fromARGB(255, 163, 163, 163),
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
                  top: 460,
                  height: 16,
                  width: 180,
                  label: "already have an account?",
                  labelAlignment: Alignment.center,
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  fill: const Color.fromARGB(0, 224, 202, 7),
                  hoverFill: const Color.fromARGB(0, 196, 177, 10),
                  pressedFill: const Color.fromARGB(0, 255, 255, 255),
                  boxShadow: const [],
                ),
              ]),
            )));
  }
}

class SignUp2Panel extends StatefulWidget {
  final User user;
  const SignUp2Panel({super.key, required this.user});

  @override
  State<SignUp2Panel> createState() => _SignUp2Panel();
}

class _SignUp2Panel extends State<SignUp2Panel>{
    String userEmail = '';
    String userContactNumber = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: max(size.height - 180, 480),
        alignment: Alignment.center,
        child: AspectRatio(
            aspectRatio: 2.0 / 3.0,
            child: Container(
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
              child: Stack(alignment: Alignment.topCenter, children: <Widget>[
                Positioned(
                  top: 20,
                  child: Image.asset(
                      height: 90,
                      width: 90,
                      filterQuality: FilterQuality.high,
                      "../assets/images/logo.png"),
                ),
                const Positioned(
                  top: 130,
                  child: Text(
                    'hello,\n'
                    'name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                RoundedTextFieldComponent(
                  top: 215,
                  width: max(size.height - 180, 480) * 0.667 - 110,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(140, 20, 20, 20),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                  label: "e-mail",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    setState(() {
                      userEmail = value;
                    });
                  },
                ),
                RoundedTextFieldComponent(
                  top: 270,
                  width: max(size.height - 180, 480) * 0.667 - 110,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(140, 20, 20, 20),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                  label: "phone number",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    setState(() {
                    userContactNumber = value;
                    });
                  },
                ),
                RoundedButtonComponent(
                  key: UniqueKey(),
                  top: 405,
                  height: 42,
                  width: 140,
                  label: "conclude register",
                  labelAlignment: Alignment.center,
                  onPressed: () {
                    widget.user.concludeRegister(userEmail, userContactNumber);
                    Navigator.pushNamed(context, '/login');
                  },
                  isDisabled: userEmail.isEmpty || userContactNumber.isEmpty,
                  disabledFill: const Color.fromARGB(255, 163, 163, 163),
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
                  top: 460,
                  height: 16,
                  width: 69,
                  label: "previous",
                  labelAlignment: Alignment.center,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fill: const Color.fromARGB(0, 224, 202, 7),
                  hoverFill: const Color.fromARGB(0, 196, 177, 10),
                  pressedFill: const Color.fromARGB(0, 255, 255, 255),
                  boxShadow: const [],
                ),
              ]),
            )));
  }
}
