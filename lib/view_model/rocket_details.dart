import 'package:flutter/material.dart';
import 'package:apod/view_model/provider/url_luncher.dart'; // Make sure launchLink is defined here
import 'package:apod/widget/custom_theme/theme.dart'; // For NavBarcolor, Textcolor, Cardcolor

class RocketDetails extends StatelessWidget {
  const RocketDetails({super.key});

  // Helper widget for info rows (retained from previous example)
  Widget _buildInfoRow(String label, String? value,
      {Color valueColor = Textcolor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15, // Slightly smaller for rows
              color: Colors.white70,
            ),
          ),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : 'N/A',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: valueColor, // Use provided color
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to get status color
  Color _getStatusColor(String? status) {
    final lowerStatus = status?.toLowerCase() ?? 'unknown';
    if (lowerStatus == 'active' || lowerStatus == 'operational') {
      return Colors.green;
    } else if (lowerStatus == 'retired') {
      return Colors.red;
    } else if (lowerStatus == 'under-development') {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      // ... (keep existing null arguments handler)
      return Scaffold(
        backgroundColor: Colors.black, // Match theme
        appBar: AppBar(
          backgroundColor: NavBarcolor,
          iconTheme: IconThemeData(color: Textcolor, weight: 20),
        ),
        body: Center(
          child: Text(
            'No data provided.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    // Extract main rocket status safely
    final String mainStatus = arguments['status']?.toString() ?? 'Unknown';
    final Color mainStatusColor = _getStatusColor(mainStatus);

    // --- Extract Variants List ---
    final variantsList = arguments['variants'] as List<dynamic>?; // Safely cast

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(arguments['name'] ?? 'Rocket Details',
            style: const TextStyle(color: Textcolor)),
        backgroundColor: NavBarcolor,
        iconTheme: const IconThemeData(color: Textcolor, weight: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Text(
                arguments['name'] ?? 'Not available',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Textcolor,
                ),
              ),
              const SizedBox(height: 4),
              // Display main status only if it's not redundant (e.g., if variants exist)
              if (variantsList == null ||
                  variantsList
                      .isEmpty) // Show general status if no variants or for GSLV base
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Overall Status: $mainStatus",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: mainStatusColor,
                    ),
                  ),
                ),
              const SizedBox(height: 20),

              // --- Details Section ---
              // ... (keep existing Details Card section) ...
              const Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28, // Adjusted size
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                shadowColor: Colors.white12,
                color: Cardcolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arguments['details'] ??
                            'No details available.', // Use lowercase 'details'
                        style: const TextStyle(
                          fontWeight: FontWeight.w500, // Slightly less bold
                          fontSize: 15,
                          color: Textcolor,
                          height: 1.4, // Improve readability
                        ),
                      ),
                      // Only show Wiki link if available
                      if (arguments['link'] != null &&
                          arguments['link'].isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(
                              height: 1, thickness: 1, color: Colors.grey),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30)), // Adjust padding
                          onPressed: () {
                            launchLink(arguments[
                                "link"]); // Assuming launchLink handles errors
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Wikipedia Info",
                                style: TextStyle(
                                  color: Colors.blueAccent, // Link color
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // --- Overall Specifications Section (Optional - show only if no variants?) ---
              // You might want to hide this if variants are present, as specs might differ
              if (variantsList == null || variantsList.isEmpty) ...[
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline_sharp,
                      size: 24,
                      color: Colors.cyan,
                    ),
                    SizedBox(width: 8),
                    Text("Specifications",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.cyan)),
                  ],
                ),
                const SizedBox(height: 8),
                Card(
                  elevation: 2,
                  shadowColor: Colors.white12,
                  color: Cardcolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(
                            "First Flight", arguments['first-flight']),
                        _buildInfoRow(
                            "Missions", arguments['missions']?.toString()),
                        _buildInfoRow(
                            "Successful", arguments['successful']?.toString(),
                            valueColor: Colors.green.shade300),
                        _buildInfoRow(
                            "Failures", arguments['failures']?.toString(),
                            valueColor: Colors.red.shade300),
                        _buildInfoRow("Partial Failures",
                            arguments['partial_failures']?.toString(),
                            valueColor: Colors.orange.shade300),
                        _buildInfoRow(
                            "Height", arguments['rocket-height']?.toString()),
                        _buildInfoRow("fairing-diameter",
                            arguments['fairing-diameter']?.toString()),
                        _buildInfoRow("payload-to-LEO",
                            arguments['payload-to-LEO']?.toString()),
                        _buildInfoRow(
                            "Stages", arguments['stages']?.toString()),
                        _buildInfoRow(
                            "Strap-ons", arguments['strap-ons']?.toString()),
                        _buildInfoRow("Liftoff Mass",
                            arguments['liftoff-mass']?.toString()),
                        _buildInfoRow("Liftoff Thrust",
                            arguments['liftoff-thrust']?.toString()),
                        _buildInfoRow("Payload to LEO",
                            arguments['payload-to-LEO']?.toString()),
                        _buildInfoRow("Payload to GTO",
                            arguments['payload-to-GTO']?.toString()),
                        _buildInfoRow("fairing height",
                            arguments['fairing-height']?.toString()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],

              // --- Variants Section ---
              if (variantsList != null && variantsList.isNotEmpty) ...[
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call_split_rounded, // Icon for variants
                      size: 26,
                      color: Colors.orangeAccent, // Variants color
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Variants",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.orangeAccent, // Variants color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Use Column to display variants with ExpansionTiles
                Column(
                  children: variantsList.map((variantData) {
                    // Cast safely
                    if (variantData is! Map<String, dynamic>) {
                      return const SizedBox
                          .shrink(); // Skip if data is not a map
                    }
                    final variant = variantData;

                    final String variantName =
                        variant['name']?.toString() ?? 'Unnamed Variant';
                    final String variantStatus =
                        variant['status']?.toString() ?? 'Unknown';
                    final Color variantStatusColor =
                        _getStatusColor(variantStatus);
                    final String? variantDetails =
                        variant['details']?.toString();
                    final String? variantLink = variant['link']?.toString();

                    return Card(
                      elevation: 1,
                      color:
                          Cardcolor, // Slightly different bg for variant cards
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child: ExpansionTile(
                        iconColor: Textcolor,
                        collapsedIconColor: Textcolor,
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Allow name to wrap if long
                              child: Text(
                                variantName,
                                style: const TextStyle(
                                    color: Textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                                overflow:
                                    TextOverflow.ellipsis, // Prevent overflow
                              ),
                            ),
                            const SizedBox(width: 10), // Space before status
                            Container(
                              // Status Chip like look
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                  color: variantStatusColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: variantStatusColor, width: 0.5)),
                              child: Text(
                                variantStatus,
                                style: TextStyle(
                                    color: variantStatusColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        children: [
                          // Content visible when expanded
                          Padding(
                            padding:
                                const EdgeInsets.all(14.0).copyWith(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (variantDetails != null &&
                                    variantDetails.isNotEmpty) ...[
                                  Text(
                                    variantDetails,
                                    style: const TextStyle(
                                        color: Textcolor,
                                        fontSize: 14,
                                        height: 1.3),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                                // Display variant-specific specs using the helper row
                                _buildInfoRow("Rocket Height",
                                    variant['rocket-height']?.toString()),
                                _buildInfoRow("Strap-ons",
                                    variant['strap-ons']?.toString()),
                                _buildInfoRow("Payload to LEO",
                                    variant['payload-to-LEO']?.toString()),
                                _buildInfoRow("Payload to GTO",
                                    variant['payload-to-GTO']?.toString()),
                                _buildInfoRow("Liftoff Thrust",
                                    variant['liftoff-thrust']?.toString()),
                                _buildInfoRow("Fairing Diameter",
                                    variant['fairing-diameter']?.toString()),
                                _buildInfoRow("Fairing Height",
                                    variant['fairing-height']?.toString()),

                                // Add more variant specs as needed...

                                // Add Link button for the variant if available
                                if (variantLink != null &&
                                    variantLink.isNotEmpty) ...[
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.grey),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(50, 30)),
                                    onPressed: () {
                                      launchLink(variantLink);
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Wikipedia Info ",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded,
                                            size: 16, color: Colors.blueAccent),
                                      ],
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(), // Convert map result to List<Widget>
                ),
                const SizedBox(height: 25), // Spacing after variants section
              ],

              // --- Launch Site Section ---
              // ... (keep existing Launch Site Card section) ...
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rocket_launch_outlined, // Changed icon
                    size: 28, // Adjusted size
                    color: Colors.purple,
                  ),
                  SizedBox(width: 8),
                  Text("Launch Site",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.purple)),
                ],
              ),
              const SizedBox(height: 8),
              // Card(
              //   elevation: 2,
              //   shadowColor: Colors.white12,
              //   color: Cardcolor,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8)),
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           "Satish Dhawan Space Centre (SDSC) SHAR", // Hardcoded - Ideally fetch if available
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18, // Adjusted size
              //             color: Textcolor,
              //           ),
              //         ),
              //         const Text(
              //           "Sriharikota, Andhra Pradesh, India", // Hardcoded
              //           style: TextStyle(
              //             fontSize: 14, // Adjusted size
              //             color: Colors.white70,
              //           ),
              //         ),
              //         const Padding(
              //           padding: EdgeInsets.symmetric(vertical: 10.0),
              //           child: Divider(
              //               height: 1, thickness: 1, color: Colors.grey),
              //         ),
              //         TextButton(
              //             style: TextButton.styleFrom(
              //                 padding: EdgeInsets.zero,
              //                 minimumSize: Size(50, 30)),
              //             onPressed: () {
              //               // Use the specific link if available, otherwise the general one
              //               launchLink(
              //                   "https://en.wikipedia.org/wiki/Satish_Dhawan_Space_Centre");
              //             },
              //             child: const Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   "More Info (Launch Site)",
              //                   style: TextStyle(
              //                       color: Colors.blueAccent, // Link color
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w700),
              //                 ),
              //                 Icon(
              //                   Icons.arrow_forward_ios_rounded,
              //                   size: 18,
              //                   color: Colors.blueAccent,
              //                 ),
              //               ],
              //             )),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
