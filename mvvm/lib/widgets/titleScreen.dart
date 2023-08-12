import 'package:flutter/material.dart';

class TItleText extends StatelessWidget {
  final String title;
  const TItleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title.toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
