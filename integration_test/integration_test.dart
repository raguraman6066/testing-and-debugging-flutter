import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patterns/main.dart';

//automated test
void main() {
  // This makes it an integration test
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end to end test", () {
    testWidgets("tap on the floating action button, verify counter", (
      tester,
    ) async {
      //load app
      await tester.pumpWidget(MyApp());
      expect(find.text("0"), findsOneWidget);
      //finds the floating action button to tap on
      final Finder fab = find.byTooltip("Increment");
      //make it tap
      await tester.tap(fab);
      //wait until all loads
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
