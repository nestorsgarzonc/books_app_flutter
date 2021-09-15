import 'package:hive/hive.dart';

abstract class IDbHandler {
  Future<Object> get(String key);
  Future<void> update(String key, Object value);
  Future<void> delete(String key);
  Future<void> create(String key, Object value);
  Future<void> clean();
}

class DbHandler implements IDbHandler {
  static const _box = 'FLbox';

  Future<Box> openBox() async {
    return Hive.openBox(_box);
  }

  @override
  Future<void> create(String key, Object value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    final box = await openBox();
    await box.delete(key);
  }

  @override
  Future<Object> get(String key) async {
    final box = await openBox();
    return box.get(key);
  }

  @override
  Future<void> update(String key, Object value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  @override
  Future<void> clean() async {
    final box = await openBox();
    await box.deleteFromDisk();
  }
}
