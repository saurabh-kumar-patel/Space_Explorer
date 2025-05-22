import 'package:flutter/material.dart';

import 'custom_theme/theme.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.img,
    required this.text,
    this.location,
    this.date,
    this.vehicle,
  });
  final String img;
  final String text;
  final String? location;
  final String? date;
  final String? vehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Listcolor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
        ),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(img),
                  )),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      vehicle ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Textcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      location ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Textcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      date ?? "",
                      style: const TextStyle(
                          color: Textcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
