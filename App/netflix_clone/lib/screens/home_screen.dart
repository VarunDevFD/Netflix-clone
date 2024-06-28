import 'package:flutter/material.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final String selectedImage;
  final String userName;

  const HomeScreen({
    Key? key,
    required this.selectedImage,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 123, 15, 7),
      appBar: AppBar(
        backgroundColor: AppColors.blackOpc,
        title: Image.asset(
          'assets/logo/logo.png',
          height: 80,
          width: 70,
        ),
        automaticallyImplyLeading: false, // Disable default back arrow
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              size: 40,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(selectedImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle TV Shows button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .primary, // Example primary color, adjust as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('TV Shows'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Movies button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .primary, // Example primary color, adjust as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Movies'),
                ),
                DropdownButton<String>(
                  onChanged: (String? value) {
                    // Handle dropdown item selection
                    switch (value) {
                      case 'Categories':
                        // Handle Categories button press
                        break;
                      // Add other cases as needed
                    }
                  },
                  items: <String>[
                    'Categories',
                    'Documentaries',
                    'Comedies',
                    'Action'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_drop_down),
                  style: const TextStyle(color: Colors.white),
                  underline: Container(),
                  dropdownColor: AppColors
                      .primary, // Example dropdown background color, adjust as needed
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    Colors.black, // Example background color, adjust as needed
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/live_video.jpg'), // Replace with live video asset
                  fit: BoxFit.cover,
                ),
              ),
              height: 400, // Adjust container height as needed
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Get Game button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors
                            .primary, // Example background color with opacity
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Get Game'),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle My List button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors
                            .primary, // Example background color with opacity
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text('My List'),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset(
                      'assets/images/left_image.png', // Replace with left image asset
                      height: 50, // Adjust height as needed
                      width: 50, // Adjust width as needed
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      'Cozy Grove: Camp Spirit', // Replace with actual text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
