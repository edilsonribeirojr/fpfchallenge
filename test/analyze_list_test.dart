import 'package:test/test.dart';
import 'package:fpf_project/utils/parte1.dart';

void main() {
  group('analyzeList', () {
    test('should return correct smallest, largest, and sum', () {
      final result = analyzeList([1, 2, 3, 4, 5]);

      expect(result['smallest'], equals(1));
      expect(result['largest'], equals(5));
      expect(result['sum'], equals(15));
    });

    test('should handle a list with negative numbers', () {
      final result = analyzeList([-10, -5, 0, 5, 10]);

      expect(result['smallest'], equals(-10));
      expect(result['largest'], equals(10));
      expect(result['sum'], equals(0));
    });

    test('should handle a list with all equal numbers', () {
      final result = analyzeList([7, 7, 7, 7]);

      expect(result['smallest'], equals(7));
      expect(result['largest'], equals(7));
      expect(result['sum'], equals(28));
    });
  });
}
