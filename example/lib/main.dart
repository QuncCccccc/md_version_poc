// Import Standalone Material 3 version directly
import 'package:poc_m3e_subfolder/m3.dart';
// Only bring in the version-specific M3E widgets for comparison
import 'package:poc_m3e_subfolder/m3e.dart' as m3e show TextButton, Switch;


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
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text('m3.TextButton'),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Text Button'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 48),
                  Column(
                    children: [
                      const Text('m3e.TextButton'),
                      const SizedBox(height: 8),
                      m3e.TextButton(
                        onPressed: () {},
                        child: const Text('Text Button'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),

              const Text('3. Unchanged Widget (Switch)'),
              const SizedBox(height: 16),
              const SwitchDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _m3Value = true;
  bool _m3eValue = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text('m3.Switch'),
            const SizedBox(height: 8),
            Switch(
              value: _m3Value,
              onChanged: (v) {
                setState(() {
                  _m3Value = v;
                });
              },
            ),
          ],
        ),
        const SizedBox(width: 48),
        Column(
          children: [
            const Text('m3e.Switch'),
            const SizedBox(height: 8),
            m3e.Switch(
              value: _m3eValue,
              onChanged: (v) {
                setState(() {
                  _m3eValue = v;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

