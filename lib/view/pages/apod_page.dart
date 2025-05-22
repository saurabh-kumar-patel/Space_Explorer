import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:apod/widget/sliver_bar.dart';

import '../../view_model/provider/apod_provider.dart';
import '../../view_model/provider/stream_controller.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({super.key});

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  late ApodProvider Apod;
  late Stream stream;
  var isDeviceConnect = false;
  bool isAlertSet = false;

  @override
  void initState() {
    streamController = StreamController.broadcast();
    Apod = Provider.of<ApodProvider>(context, listen: false);
    stream = streamController.stream;
    Apod.getRandomApod();
    getConnectivity();
    super.initState();
  }

  StreamSubscription<List<ConnectivityResult>>? subscription;

  void getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        final bool isDeviceConnected =
            await InternetConnectionChecker.instance.hasConnection;

        if (!isDeviceConnected && !isAlertSet) {
          if (context.mounted) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    Apod.cancelOperation?.cancel();
    streamController.close();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade300,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            sliverBarDate(context, streamController, Apod),
            StreamBuilder(
              stream: stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 0,
                              childAspectRatio: 1,
                              crossAxisCount: 1,
                              mainAxisSpacing: 10));
                }

                return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'explanation',
                                arguments: {
                                  'title':
                                      snapshot.data[index].title.toString(),
                                  'date': snapshot.data[index].date.toString(),
                                  'serviceVersion': snapshot
                                      .data[index].serviceVersion
                                      .toString(),
                                  'img': snapshot.data[index].url.toString(),
                                  'explanation': snapshot
                                      .data[index].explanation
                                      .toString(),
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.blueAccent[300],
                              shadowColor: Colors.black,
                              elevation: 2,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: constraints
                                            .maxWidth, // Use available width
                                        height: constraints.maxWidth /
                                            1.5, // Example: 1.5 aspect ratio
                                        child: Image(
                                          image: NetworkImage(
                                              snapshot.data[index].hdurl),
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3),
                                        child: Text(
                                          "Title:${snapshot.data[index].title}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: Text(
                                          "Date:${snapshot.data[index].date}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: snapshot.data.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            childAspectRatio: 1,
                            crossAxisCount: 1,
                            mainAxisSpacing: 1));
              },
            )
          ],
        ),
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
                    await InternetConnectionChecker.instance.hasConnection;
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
