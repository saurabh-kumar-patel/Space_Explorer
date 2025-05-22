import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final String image;
  const CardWidget({
    super.key,
    required this.image,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Text(
              title ?? "",
              style: const TextStyle(
                  color: Textcolor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
