import 'package:recipe_scraper/src/utils.dart';
import 'package:test/test.dart';

void main() {
  group('utils', () {
    test('trim string', () {
      final data = "  hello  ";
      final result = trim(data);

      expect(result, "hello");
    });
  });
}
