import 'package:flutter/material.dart';
import 'package:flutter_application_test/page/form_login_page.dart';
import 'package:flutter_application_test/widget/text_field_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test UI Contact', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FormLoginPage(),
      ),
    );

  await tester.pumpAndSettle();

  expect(find.text("Login"), findsOneWidget);

  expect(find.byType(TextFieldWidget), findsNWidgets(2));

  await tester.tap(find.text("Save"));
  });
}
