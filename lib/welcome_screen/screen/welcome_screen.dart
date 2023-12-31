import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../home_screen/screen/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String route = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(defaultPadding * 3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350]!,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset("assets/images/Logo_New.png"),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2.0),
                  child: OutlinedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, HomeScreen.route),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2.0,
                        horizontal: defaultPadding,
                      ),
                      minimumSize: Size(size.width, 56.0),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
