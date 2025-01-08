import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> selectDate(context, streamController, nasa) async {
  DateTime? pickDate = await showDatePicker(
    context: context,
    initialDate: DateTime.timestamp(),
    firstDate: DateTime(2000, 05, 17),
    lastDate: DateTime.now(),
  );
  if(pickDate !=null){
    streamController.sink.add(null);
    await nasa.cancelOperation?.cancel();
    nasa.getApodDate(pickDate);
    if (kDebugMode) {
      print("Date time : $pickDate");

    }
  }else{
    if (kDebugMode) {
      print("No select date");
    }
  }
}
