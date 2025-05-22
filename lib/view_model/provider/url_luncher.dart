import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String link) async {
  try {
    await launchUrl(
      Uri.parse(link),
    );
  } catch (exception) {
    rethrow;
  }
}
