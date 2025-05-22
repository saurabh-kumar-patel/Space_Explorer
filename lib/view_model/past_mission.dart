// import "package:apod/view_model/provider/url_luncher.dart";
// import "package:apod/widget/custom_theme/theme.dart";
// import "package:flutter/material.dart";
//
// class PastMissionPage extends StatelessWidget {
//   const PastMissionPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//
//     if (arguments == null) {
//       return const Scaffold(
//         body: Center(
//             child: Text('No data provided.',
//                 style: TextStyle(color: Colors.white))),
//         backgroundColor: Colors.black,
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: NavBarcolor,
//         iconTheme: const IconThemeData(color: Textcolor, weight: 20),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             spacing: 2,
//             children: [
//               Text(arguments['title'] ?? 'Not available.',
//                   maxLines: 2,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                       color: Textcolor)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Date: ${arguments['Date'] ?? 'Not available.'}",
//                       maxLines: 2,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           color: Textcolor)),
//                 ],
//               ),
//               const Row(
//                 spacing: 2,
//                 children: [
//                   Icon(
//                     Icons.description,
//                     size: 35,
//                     color: Colors.purple,
//                   ),
//                   Text("Mission Details",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 35,
//                           color: Colors.purple)),
//                 ],
//               ),
//               Card(
//                 elevation: 1,
//                 shadowColor: Colors.white12,
//                 color: Cardcolor,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     spacing: 3,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(arguments['title'] ?? 'Not available.',
//                           maxLines: 2,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25,
//                               color: Textcolor)),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 1),
//                         child: Text(
//                             arguments['Details'] ?? 'No details available.',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                                 color: Textcolor)),
//                       ),
//                       Text("Orbit: ${arguments['orbit'] ?? 'Not available.'}",
//                           maxLines: 2,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                               color: Colors.purple)),
//                       Text(
//                           "Payloads: ${arguments['payloads'] ?? 'Not available.'}",
//                           maxLines: 2,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                               color: Colors.purple)),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Divider(
//                             height: 2, thickness: 4, color: Colors.grey),
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             launchLink(arguments["link"]);
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Wiki Info",
//                                   style: TextStyle(
//                                       color: Textcolor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w700)),
//                               Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 size: 20,
//                                 color: Colors.white,
//                               )
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//               const Row(
//                 spacing: 2,
//                 children: [
//                   Icon(
//                     Icons.rocket,
//                     size: 35,
//                     color: Colors.purple,
//                   ),
//                   Text("Rocket",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 35,
//                           color: Colors.purple)),
//                 ],
//               ),
//               Card(
//                 elevation: 1,
//                 shadowColor: Colors.white12,
//                 color: Cardcolor,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     spacing: 3,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         spacing: 3,
//                         children: [
//                           Image(
//                             image: NetworkImage(arguments['img']),
//                             width: 80,
//                             height: 100,
//                           ),
//                           Text(arguments['vehicle'] ?? 'Not available.',
//                               maxLines: 1,
//                               overflow: TextOverflow.fade,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 25,
//                                   color: Textcolor)),
//                         ],
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Divider(
//                             height: 2, thickness: 4, color: Colors.grey),
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             launchLink(arguments["link"]);
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("More Info",
//                                   style: TextStyle(
//                                       color: Textcolor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w700)),
//                               Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 size: 20,
//                                 color: Colors.white,
//                               )
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//               const Row(
//                 spacing: 2,
//                 children: [
//                   Icon(
//                     Icons.location_on,
//                     size: 35,
//                     color: Colors.purple,
//                   ),
//                   Text("Launch Site",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 35,
//                           color: Colors.purple)),
//                 ],
//               ),
//               Card(
//                 elevation: 1,
//                 shadowColor: Colors.white12,
//                 color: Cardcolor,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     spacing: 3,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(arguments['place'] ?? 'Not available.',
//                           maxLines: 2,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Textcolor)),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Divider(
//                             height: 2, thickness: 4, color: Colors.grey),
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             launchLink(
//                                 "https://en.wikipedia.org/wiki/Satish_Dhawan_Space_Centre");
//                           },
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("More Info",
//                                   style: TextStyle(
//                                       color: Textcolor,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w700)),
//                               Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 size: 20,
//                                 color: Colors.white,
//                               )
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
