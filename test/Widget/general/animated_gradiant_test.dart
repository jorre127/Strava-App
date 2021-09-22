
import 'package:flutter_template/widget/general/animated_gradiant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animated gradiant', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const AnimatedGradiant());
  });
}
