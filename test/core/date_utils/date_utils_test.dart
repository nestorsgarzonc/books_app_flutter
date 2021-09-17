import 'package:flutter_books/core/utils/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DateUtils test', () {
    test('Should return greeting mesage in the morning', () {
      final date = DateTime.parse("2012-02-27 01:27:00");
      final res = CustomDateUtils.getGreeting(dateTime: date);
      expect(res, 'Good Morning');
    });

    test('Should return greeting mesage in the afternoon', () {
      final date = DateTime.parse("2012-02-27 13:27:00");
      final res = CustomDateUtils.getGreeting(dateTime: date);
      expect(res, 'Good Afternoon');
    });

    test('Should return greeting mesage in the evening', () {
      final date = DateTime.parse("2012-02-27 21:27:00");
      final res = CustomDateUtils.getGreeting(dateTime: date);
      expect(res, 'Good Evening');
    });
  });
}
