import 'package:flutter/material.dart';
import 'package:flutter_application_test/page/contact_page.dart';
import 'package:flutter_application_test/theme/theme_text_style.dart';
import 'package:flutter_application_test/widget/text_field_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test UI Contact', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactPage(),
      ),
    );

  await tester.pumpAndSettle();

  expect(find.text("Contact"), findsOneWidget);
  final iconLogout = find.byIcon(Icons.logout);
  expect(iconLogout, findsOneWidget);

  final textWidget3 = find.text('Contact');
  final textStyleWidget3 = tester.widget<Text>(textWidget3);
  expect(textStyleWidget3.style, equals(ThemeTextStyle().m3DisplayLarge));


  expect(find.byType(TextFieldWidget), findsNWidgets(2));

  expect(find.text("Date"), findsOneWidget);
  await tester.tap(find.text("Select"));

  expect(find.text("Color"), findsOneWidget);
  await tester.tap(find.text("Pick Color"), warnIfMissed: false);

  expect(find.text("Pilih File"), findsOneWidget);
  await tester.tap(find.text("Pick File"), warnIfMissed: false);

  
  });
}
