import 'package:flutter_books/core/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Failure test', () {
    test('Should keep message', () {
      const failure = Failure(message: 'test');
      expect(failure.message, 'test');
    });

    test('Should print message', () {
      const failure = Failure(message: 'test');
      final message = failure.toString();
      expect(message, 'test');
    });

    test('Should print default message', () {
      const failure = Failure();
      final message = failure.toString();
      expect(message, 'An error has occurred');
    });
  });
}
