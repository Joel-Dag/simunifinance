import 'package:flutter_test/flutter_test.dart';
import 'package:simuni/main.dart';

void main() {
  testWidgets('Simuni smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SimuniApp());
    expect(find.textContaining('Simuni'), findsOneWidget);
  });
}