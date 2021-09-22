import 'package:flutter_template/widget/general/section_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Section Title',
    (tester) async {
      await tester.pumpWidget(const SectionTitle(title: 'title'),);
      final titleFinder = find.text('title');

      expect(titleFinder, findsOneWidget);
    },
  );
}
