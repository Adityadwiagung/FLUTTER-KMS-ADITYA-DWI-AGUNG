import 'package:flutter/material.dart';
import 'package:flutter_application_test2/page/header_page.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Test UI HeaderPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final timeaAnimaText = find.text('TIMEA ANIMA');
    expect(timeaAnimaText, findsOneWidget);

    final timeaAnimaTextStyle = tester.widget<Text>(timeaAnimaText).style;
    expect(timeaAnimaTextStyle?.fontSize, 20); 
    expect(timeaAnimaTextStyle?.fontWeight, FontWeight.bold); 
    expect(timeaAnimaTextStyle?.color, Colors.white);

    final modelsComeTrueText = find.text("Make Your 3D Models Come True");
    expect(modelsComeTrueText, findsOneWidget);


    final modelsComeTrueTextStyle = tester.widget<Text>(modelsComeTrueText).style;
    expect(modelsComeTrueTextStyle?.fontSize, 20); 
    expect(modelsComeTrueTextStyle?.fontWeight, FontWeight.bold); 
    expect(modelsComeTrueTextStyle?.color, Colors.white); 

    expect(find.byType(Divider), findsOneWidget);
  });
}
