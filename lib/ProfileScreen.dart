import 'package:flutter/material.dart';
import 'package:shop_application/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

// öğrenci grubunu ve becerilerini gösterme

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final String studentGroup = 'Project Group: \n1. Ege Evcil'
      '\n2. Talha Topal'
      '\n3. Kutay Yesilyurt'
      '\n4. Alkın Sahin';
  final List<String> skills = [
    'Flutter',
    'Dart',
    'UI/UX Design',
    'Database with Firebase',
    'E-Commerce App',
    'Note App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$studentGroup',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Skills:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: skills
                  .map(
                    (skill) => Text(
                  '- $skill',
                  style: const TextStyle(fontSize: 16.0),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}



