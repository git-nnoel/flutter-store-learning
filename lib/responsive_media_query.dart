import 'package:flutter/material.dart';

import 'Model/user.dart';
import 'Screens/Components/app_bar.dart';
import 'Screens/Home/login_panel.dart';
import 'Screens/Home/signup_panel.dart';

class InitialRouteQuery extends StatefulWidget {
  const InitialRouteQuery({Key? key}) : super(key: key);

  @override
  State<InitialRouteQuery> createState() => _InitialRouteQueryState();
}

class _InitialRouteQueryState extends State<InitialRouteQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("../assets/images/bg4.jpg"),
              fit: BoxFit.cover,
              opacity: 0.1),
              color: Color.fromARGB(255, 44, 44, 44)
              ),
      child: ListView(children: const <Widget>[
        CustomAppBar(),
        UnconstrainedBox(child: LoginPanel())
      ]),
    ));
  }
}

class SignUpRouteQuery extends StatefulWidget {
  const SignUpRouteQuery({Key? key}) : super(key: key);

  @override
  State<SignUpRouteQuery> createState() => _SignUpRouteQueryState();
}

class _SignUpRouteQueryState extends State<SignUpRouteQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("../assets/images/bg4.jpg"),
              fit: BoxFit.cover,
              opacity: 0.1),
          color: Color.fromARGB(255, 44, 44, 44),
          ),
      child: ListView(children: const <Widget>[
        CustomAppBar(),
        UnconstrainedBox(child: SignUpPanel())
      ]),
    ));
  }
}

class SignUp2Query extends StatefulWidget {
  final User user;
  const SignUp2Query({Key? key, required this.user}) : super(key: key);

  @override
  State<SignUp2Query> createState() => _SignUp2QueryState();
}

class _SignUp2QueryState extends State<SignUp2Query> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("../assets/images/bg4.jpg"),
              fit: BoxFit.cover,
              opacity: 0.1),
          color: Color.fromARGB(255, 44, 44, 44),
          ),
      child: ListView(children: <Widget>[
        const CustomAppBar(),
        UnconstrainedBox(child: SignUp2Panel(user: widget.user))
      ]),
    ));
  }
}