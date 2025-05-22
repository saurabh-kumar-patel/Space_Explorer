import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class ExplanationPage extends StatelessWidget {
  const ExplanationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          argument['title'] ?? 'APOD',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: NetworkImage(argument['img'] ?? 'image error')),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text('Date:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 2),
                    child: Text(argument['date'] ?? 'No explanation available.',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ],
              ),
            ),
            const Text('EXPLANATION',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black)),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Divider(
                thickness: 1.4,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                  argument['explanation'] ?? 'No explanation available.',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black)),
            ),
            const Text(
              "....Thank you....",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
