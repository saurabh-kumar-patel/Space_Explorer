import 'package:flutter/material.dart';
import 'package:apod/widget/select_date.dart';

SliverAppBar sliverBarDate(context, streamController, nasa) {
  return SliverAppBar(

    titleSpacing: 1,
    leadingWidth: 0,
    backgroundColor: Colors.blue.shade700,
    title: ListTile(
        leading: FloatingActionButton(
          heroTag: 'hero_apod_floatingbutton',
          tooltip: 'select your date',
          backgroundColor: Colors.blue.shade500,
          child: Icon(
            Icons.calendar_month_sharp,
            color: Colors.blue.shade100,
          ),
          onPressed: () {
            selectDate(context, streamController, nasa);
          },
        ),

        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: const ListTile(
            leading: Icon(
              applyTextScaling: true,
              color: Colors.white70,
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            ),
            title: Text(
                textAlign: TextAlign.center,
                ' SELECT SPECIAL DATE AND VIEW PHOTO',
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        )),
    leading: const Icon(null),
    expandedHeight: 80.0,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: const EdgeInsets.all(10),
      background: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.blueAccent])),
      ),
    ),
  );
}
