import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/nasa/nasa_rockets.dart';

class NasaRocketsTab extends StatefulWidget {
  const NasaRocketsTab({super.key});

  @override
  State<NasaRocketsTab> createState() => _NasaRocketsTabState();
}

class _NasaRocketsTabState extends State<NasaRocketsTab> {
  @override
  Widget build(BuildContext context) {
    return const NasaRockets();
  }
}
