import 'package:flutter/material.dart';

// Import both Material versions using namespace aliases to prevent collision
import 'package:poc_m3e_subfolder/material_m3.dart' as m3;
import 'package:poc_m3e_subfolder/material_m3e.dart' as m3e;

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
                'Side-by-Side Comparison:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 32),
              
              const Text('Material 3 Standard'),
              const SizedBox(height: 8),
              m3.TextButton(
                onPressed: () {},
                child: const Text('M3 TextButton'),
              ),
              
              const SizedBox(height: 32),

              const Text('Material 3 Expressive'),
              const SizedBox(height: 8),
              m3e.TextButton(
                onPressed: () {},
                child: const Text('M3E TextButton'),
              ),
              
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),
              
              // Accessing TextButton via either namespace
              // Both m3.TextButton and m3e.TextButton rely on the shared core implementation
              m3e.TextButton(
                onPressed: () {},
                child: const Text('M3E Specific TextButton Component'),
              ),
              const SizedBox(height: 16),
              m3.TextButton(
                onPressed: () {},
                child: const Text('M3 Specific TextButton Component'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
