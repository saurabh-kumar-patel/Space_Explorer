import 'dart:convert';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../provider/url_luncher.dart';

class MissionListScreen extends StatefulWidget {
  const MissionListScreen({super.key});

  @override
  _MissionListScreenState createState() => _MissionListScreenState();
}

class _MissionListScreenState extends State<MissionListScreen> {
  List<dynamic> missions = [];   // Store the mission data
  bool isLoading = true;        // Track loading state
  String errorMessage = '';   // Track error message

  @override
  void initState() {
    super.initState();
    fetchMissions();
  }

  Future<void> fetchMissions() async {
    setState(() {
      isLoading = true; // Start loading
      errorMessage = ''; // Clear any previous error
    });
    final url = Uri.parse(
        'http://127.0.0.1:5000/upcoming_missions'); // Replace with your Flask API URL
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          missions = jsonDecode(response.body);
          isLoading = false; // Loading complete
        });
      } else {
        setState(() {
          errorMessage = 'Failed to fetch missions: ${response.statusCode}';
          isLoading = false; // Loading complete (with error)
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;      // Loading complete (with error)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator()); // Loading indicator
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage)); // Error message
    }
    return ListView.separated(
      scrollDirection:Axis.horizontal,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
        itemCount: missions.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final mission = missions[index];
          return Container(
            width: 400,
            height: 250,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0XFFfc5c7d),
                  Color(0XFF6a82fb),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Textcolor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("NET ${mission['date']}",),
                  ),
                  const Divider(color: Textcolor, height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${mission['mission_name']}"),
                  ),
                  const Divider(color: Textcolor, height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${mission['vehicle']}"),
                  ),
                  const Divider(color: Textcolor, height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${mission['place']}"),
                  ),
                  const Divider(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          launchLink("${mission['link']}");
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("VISIT"),
                            SizedBox(width: 10),
                            Icon(Icons.remove_red_eye_rounded),
                          ],
                        )),
                  )

                ],
              ),
            ),

          );
        },
      padding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
