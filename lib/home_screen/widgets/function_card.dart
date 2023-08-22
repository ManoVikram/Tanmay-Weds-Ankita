import 'package:flutter/material.dart';

import '../../constants.dart';

class FunctionCard extends StatelessWidget {
  const FunctionCard({
    super.key,
    required this.thumbnail,
    required this.name,
    required this.onTap,
  });

  final String thumbnail;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 240.0,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: defaultPadding / 2.0),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
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
