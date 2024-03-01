import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments text on tap', (WidgetTester tester) async {
    // Arrange
    const initialCount = 0;

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: MyCounter(initialCount: initialCount),
      ),
    );

    // Find the counter text
    final counterTextFinder = find.text('$initialCount');

    // Assert
    expect(tester.widget<Text>(counterTextFinder), findsOneWidget);

    // Simulate tapping the button
    await tester.tap(find.byType(IconButton));

    // Rebuild the widget tree
    await tester.pump();

    // Find the updated counter text
    final updatedCounterTextFinder = find.text('${initialCount + 1}');

    // Assert that the text has been updated
    expect(tester.widget<Text>(updatedCounterTextFinder), findsOneWidget);
  });
}

class MyCounter extends StatefulWidget {
  final int initialCount;

  const MyCounter({super.key, required this.initialCount});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _count = widget.initialCount;
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_count',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: _increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
