import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String imagePath;
  final String userName;
  final VoidCallback onTap;

  const ProfileContainer({
    Key? key,
    required this.imagePath,
    required this.userName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: imagePath,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            userName,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}