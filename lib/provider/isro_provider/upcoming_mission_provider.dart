

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class UpcomingMissionProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future UpcomigMission() async{

    try {
      Uri url = Uri.parse("http://127.0.0.1:5000/upcoming_missions");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
      return jsonDecode(response.body);

      } else {
        throw Exception("Failed to load Data");
      }
    } catch (e) {

      throw Exception('Failed to load data');
    }

  }
  getUpcomingMission() async {
    _isLoading = true;
    UpcomigMission();
    notifyListeners();

  }
}