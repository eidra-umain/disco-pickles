import 'package:flutter_test/flutter_test.dart';
import 'package:libresse_cycle/app/app.dart';

void main() {
  testWidgets('App renders successfully', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Libresse Cycle Tracker'), findsOneWidget);
  });
}
