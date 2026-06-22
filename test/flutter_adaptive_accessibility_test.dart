import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_adaptive_accessibility/flutter_adaptive_accessibility.dart';

void main() {
  group('flutter_adaptive_accessibility', () {
    testWidgets('AdaptiveText renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AdaptiveText('Hello Adaptive Accessibility')),
        ),
      );

      expect(find.text('Hello Adaptive Accessibility'), findsOneWidget);
    });

    testWidgets('AdaptiveCard renders child', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AdaptiveCard(child: Text('Card Content'))),
        ),
      );

      expect(find.text('Card Content'), findsOneWidget);
    });

    testWidgets('AdaptiveContainer renders child', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AdaptiveContainer(child: Text('Container Content')),
          ),
        ),
      );

      expect(find.text('Container Content'), findsOneWidget);
    });

    testWidgets('AdaptiveVisibility shows widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AdaptiveVisibility(child: Text('Visible Widget')),
          ),
        ),
      );

      expect(find.text('Visible Widget'), findsOneWidget);
    });

    testWidgets('AdaptiveBuilder builds widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdaptiveBuilder(
              builder: (context, info) {
                return const Text('Adaptive Builder');
              },
            ),
          ),
        ),
      );

      expect(find.text('Adaptive Builder'), findsOneWidget);
    });

    testWidgets('AdaptiveRow renders', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdaptiveRow(
              children: const [Text('A'), Text('B'), Text('C')],
            ),
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);

      expect(find.text('B'), findsOneWidget);

      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('AdaptiveColumn renders', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdaptiveColumn(
              children: const [Text('1'), Text('2'), Text('3')],
            ),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);

      expect(find.text('2'), findsOneWidget);

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('AdaptiveWrap renders chips', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdaptiveWrap(
              children: const [
                Chip(label: Text('Chip 1')),
                Chip(label: Text('Chip 2')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Chip 1'), findsOneWidget);

      expect(find.text('Chip 2'), findsOneWidget);
    });

    testWidgets('AdaptiveValue resolves', (WidgetTester tester) async {
      late double value;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              value = AdaptiveValue<double>(
                mobile: 8,
                tablet: 16,
                desktop: 24,
              ).resolve(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(value > 0, true);
    });

    testWidgets('AdaptiveScaffold renders', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: AdaptiveScaffold(body: Text('Scaffold Body'))),
      );

      expect(find.text('Scaffold Body'), findsOneWidget);
    });
  });
}
