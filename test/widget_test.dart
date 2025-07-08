//This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// (Optional) If your main app is in lib/main.dart, you might import it
// import 'package:your_app_name/main.dart';

// Define a simple widget for testing purposes
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Test App'),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}

void main() {// Test case 1: Verify if a specific text exists
  testWidgets('Finds a Text widget with specific content', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // This is like starting your app.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows 'Hello, Flutter!'.
    // find.text() creates a Finder that locates Text widgets
    // containing the given string.
    expect(find.text('Hello, Flutter!'), findsOneWidget);

    // You can also verify widgets that are NOT present:
    expect(find.text('Goodbye, Flutter!'), findsNothing);

    // You can also find widgets by type:
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNothing); // Assuming no FAB in MyApp
  });

  // Test case 2: Verify the AppBar title
  testWidgets('AppBar has the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find the AppBar
    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);

    // Find the Text widget within the AppBar that displays the title
    // This uses find.descendant to look for a Text widget *within* the AppBar
    final titleFinder = find.descendant(
      of: appBarFinder,
      matching: find.text('Simple Test App'),
    );
    expect(titleFinder, findsOneWidget);
  });
}