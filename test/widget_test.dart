import 'package:flutter_test/flutter_test.dart';
import 'package:i_gaming_test_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('iGaming Test App'), findsOneWidget);
  });
}
