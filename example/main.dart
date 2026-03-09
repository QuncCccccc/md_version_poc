import 'package:flutter/material.dart' hide TextButton;

// --- VERSION MANAGEMENT POC ---
// To switch between M3 Standard and M3 Expressive, simply toggle the import below.
// Because of the subfolder/namespace solution, both libraries expose
// identically named classes (like `Button`) while sharing unmodified
// classes (like `SharedTextButton`) under the hood to prevent bloat.

import 'package:poc_m3e_subfolder/material_m3.dart';
// import 'package:poc_m3e_subfolder/material_m3e.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('M3 vs M3E Subfolder POC')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Subfolder Name-spacing in Action:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 24),

              // This 'TextButton' relies on the shared base implementation
              // but uses specific M3 or M3E defaults depending on the import
              TextButton(
                onPressed: () {},
                child: const Text('TextButton Component'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
