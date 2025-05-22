import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ImgButton extends StatelessWidget {
  const ImgButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});
  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(onPressed: onPressed, icon: icon),
        ),
        Text(
          text,
          style: TextStyle(color: Textcolor),
        ),
      ],
    );
  }
}
