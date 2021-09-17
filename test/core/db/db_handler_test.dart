import 'package:flutter_books/core/db/db_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

void main() {
  group('DB handler test', () {
    const dbPath = './test/core/db';
    Hive.init(dbPath);

    final dbHandler = DbHandler();

    test('Try get a no existent record', () async {
      final res = await dbHandler.get('key');
      expect(res, null);
    });

    test('Create a record', () async {
      const expectedVal = 'Some val';
      dbHandler.create('key', expectedVal);
      final res = await dbHandler.get('key');
      expect(res, expectedVal);
    });

    test('Update a record', () async {
      const expectedVal = 'Some val v2';
      dbHandler.update('key', expectedVal);
      final res = await dbHandler.get('key');
      expect(res, expectedVal);
    });

    test('Delete record', () async {
      dbHandler.delete('key');
      final res = await dbHandler.get('key');
      expect(res, null);
    });

    test('Clean db', () async {
      try {
        await dbHandler.clean();
      } catch (e) {
        expect(e, HiveError);
      }
    });
  });
}
