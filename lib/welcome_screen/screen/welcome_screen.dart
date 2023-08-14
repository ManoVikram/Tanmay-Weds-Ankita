import 'package:flutter/material.dart';

import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset("assets/images/Logo.png"),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding * 2.0),
                  child: OutlinedButton(
                    onPressed: () {},
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
