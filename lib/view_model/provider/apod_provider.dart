import 'dart:convert';
import 'package:apod/view_model/provider/stream_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../../model/apod_model.dart';

class ApodProvider extends ChangeNotifier {
  final String _apikey = 'Ih4Vndt2x5LHdI6ELtMW9Sdtq85zh0kAopAaOsnb';
  final int _count = 50;
  CancelableOperation? cancelOperation;
// APOD Fetch Data

  Future _randomAdop() async {
    try {
      Uri url = Uri.https('api.nasa.gov', '/planetary/apod', {
        'api_key': _apikey,
        'count': _count.toString(),
      });

      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        List<APOD> postapi = List.from(data.map((e) => APOD.fromJson(e)));
        return postapi;
      } else {
        throw Exception("Failed to load random APOD Data");
      }
    } catch (e) {
      if (kDebugMode) {
        print(" Error in fetching random APOD: $e");
      }
      throw Exception('Failed to load random APOD data');
    }
  }

  OneDate(DateTime date) async {
    String dateformate = DateFormat('yyyy-MM-dd').format(date);

    Uri url = Uri.https('api.nasa.gov', '/planetary/apod', {
      'api_key': _apikey,
      'date': dateformate,
    });

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List list = [];
        list.add(APOD.fromJson(data));
        return list;
      } else {
        // Handle specific error based on status code
        throw Exception(
            'Failed to load APOD for $dateformate (status code: ${response.statusCode})');
      }
    } catch (e) {
      print("Error fetching APOD: $e");

      throw Exception('Failed to load APOD for $dateformate');
    }
  }

  //get Random  APOD
  getRandomApod() async {
    cancelOperation = CancelableOperation.fromFuture(
      _randomAdop(),
      onCancel: () => '',
    );
    List<APOD> value = await cancelOperation?.value;
    streamController.sink.add(value);
  }

  // get a spcial Date Apod
  getApodDate(DateTime date) async {
    cancelOperation = CancelableOperation.fromFuture(
      OneDate(date),
      onCancel: () => '',
    );
    var value = await cancelOperation?.value;
    streamController.sink.add(value);
  }

  // Mars Rover Photos
}
