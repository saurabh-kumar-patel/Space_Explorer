import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  final void Function() onTap;
  const InfoCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Listcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    minVerticalPadding: 20,
                    subtitleTextStyle: const TextStyle(
                        color: Textcolor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    titleTextStyle: const TextStyle(
                        color: Textcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    title: Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                        onPressed: onTap,
                        child: const Text(
                          "details",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Listcolor,
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
