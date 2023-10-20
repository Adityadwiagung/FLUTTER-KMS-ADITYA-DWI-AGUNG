import 'package:flutter/material.dart';
import 'package:flutter_application_test/page/header_contact_page.dart';
import 'package:flutter_application_test/theme/theme_text_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI Test for HeaderContactPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderContactPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Create New Contacts"), findsOneWidget);
    expect(find.text("A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. "), findsOneWidget);

    final iconFinder = find.byIcon(Icons.phone);
    expect(iconFinder, findsOneWidget);

    final textWidget1 = find.text('Create New Contacts');
    final textStyleWidget1 = tester.widget<Text>(textWidget1);
    expect(textStyleWidget1.style, equals(ThemeTextStyle().m3HeadlineSmall));

    final textWidget2 = find.text('A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ');
    final textStyleWidget2 = tester.widget<Text>(textWidget2);
    expect(textStyleWidget2.style, equals(ThemeTextStyle().m3BodyMedium));

    expect(find.byType(Divider), findsOneWidget);
  });
}
