import 'package:flutter/material.dart';

import 'custom_theme/theme.dart';

class ListWidget extends StatelessWidget {
  final String title;
  final String img;
  final void Function() onTap;
  final String? subtitle;
  const ListWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.img,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Listcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: ListTile(
            minLeadingWidth: 50,
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(img),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
                color: Textcolor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
