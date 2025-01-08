import 'dart:async';

import 'package:apod/model/isro/spacecraft_model.dart';
import 'package:apod/provider/isro_provider/spacecraft_provider.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../provider/stream_controller.dart';
import '../../provider/url_luncher.dart';

class SpaceCraft extends StatefulWidget {
  const SpaceCraft({super.key});

  @override
  State<SpaceCraft> createState() => _SpaceCraftState();
}

class _SpaceCraftState extends State<SpaceCraft> {
  late SpacecraftProvider Craft;
  late Stream stream;
  late StreamSubscription subscription;
  var isDeviceConnect = false;
  bool isAlertSet = false;

  @override
  void initState() {
    streamController = StreamController.broadcast();
    Craft = Provider.of<SpacecraftProvider>(context, listen: false);
    stream = streamController.stream;
    Craft.getSpacecrafts();
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnect = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnect && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  @override
  void dispose() {
    Craft.cancelOperation?.cancel();
    streamController.close();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NavBarcolor,
        title: const Text(
          "Spacecrafts",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // Reverse the list before using it
          List<SpacecraftModel> reversedData=snapshot.data;
          reversedData.sort((a,b){
            return b.launchDate!.compareTo(a.launchDate!);
          });


          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              color: Cardcolor,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "${reversedData[index].name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Use: ${reversedData[index].application}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Launch Date: ${reversedData[index].launchDate}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Launch Vehicle: ${reversedData[index].launchVehicle}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  const Divider(color: Textcolor, height:8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "${reversedData[index].missionStatus}",
                            style: TextStyle(
                                color: reversedData[index]
                                            .missionStatus
                                            .toString() ==
                                        "MISSION SUCCESSFUL"
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            launchLink("${reversedData[index].link}");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("VISIT"),
                              SizedBox(width: 10),
                              Icon(Icons.remove_red_eye_rounded),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text("Please check your internet connectivity"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() => isAlertSet = false);
                isDeviceConnect =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnect) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text("ok"),
            ),
          ],
        ),
      );
}
