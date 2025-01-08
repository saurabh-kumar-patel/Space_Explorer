import 'dart:convert';
import 'package:apod/model/isro/spacecraft_model.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../stream_controller.dart';

class SpacecraftProvider extends ChangeNotifier{

  CancelableOperation? cancelOperation;

  Future spacecrafts() async {
    try {
      Uri url = Uri.parse("https://services.isrostats.in/api/spacecraft");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        List<SpacecraftModel> Postapi = List.from(data.map((e) => SpacecraftModel.fromJson(e)));
        return Postapi;
      } else {
        throw Exception("Failed to load SpaceCraft Data");
      }
    } catch (e) {
      if (kDebugMode) {
        print(" Error in fetching SpaceCraft Data: $e");
      }
      throw Exception('Failed to load SpaceCraft data');
    }

  }
  //get SpaceCrafts
  getSpacecrafts() async {
    cancelOperation = CancelableOperation.fromFuture(
      spacecrafts(),
      onCancel: () => '',
    );
    List<SpacecraftModel> value = await cancelOperation?.value;
    streamController.sink.add(value);

  }
}