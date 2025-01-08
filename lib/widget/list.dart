import 'package:flutter/material.dart';

import 'custom_theme/theme.dart';

class ListWidget extends StatelessWidget {
  String title;
  IconData icon;
  ListWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:Listcolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,size: 25,),
            ),
            title: Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                color:Backcolor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
