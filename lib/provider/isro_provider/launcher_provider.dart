import 'dart:convert';
import 'package:apod/model/isro/spacecraft_model.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../model/isro/launchers_model.dart';
import '../stream_controller.dart';

class LauncherProvider extends ChangeNotifier{

  CancelableOperation? cancelOperation;

  Future launcher() async {
    try {
      Uri url = Uri.parse("https://services.isrostats.in/api/launches");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        List<LaunchersModel> postapi = List.from(data.map((e) => LaunchersModel.fromJson(e)));
        return postapi;
      } else {
        throw Exception("Failed to load Launcher Data");
      }
    } catch (e) {
      if (kDebugMode) {
        print(" Error in fetching Launcher Data: $e");
      }
      throw Exception('Failed to load Launcher data');
    }

  }
  //get SpaceCrafts
  getLauncher() async {
    cancelOperation = CancelableOperation.fromFuture(
      launcher(),
      onCancel: () => '',
    );
    List<LaunchersModel> value = await cancelOperation?.value;
    streamController.sink.add(value);

  }
}