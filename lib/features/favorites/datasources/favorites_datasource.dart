import 'package:flutter_books/core/db/db_handler.dart';

abstract class IFavoriteDatasource {
  Future<List<String>> fetchFavorites();
  Future<void> addToFavorites(String id);
  Future<void> removeFromFavorites(String id);
}

class FavoriteDatasource extends IFavoriteDatasource {
  FavoriteDatasource(this.dbHandler);

  final IDbHandler dbHandler;

  @override
  Future<List<String>> fetchFavorites() async {
    final favorites = await dbHandler.get('favorites');
    if (favorites == null) {
      return [];
    }
    return favorites as List<String>;
  }

  @override
  Future<void> addToFavorites(String id) async {
    final favorites = await fetchFavorites();
    favorites.add(id);
    await dbHandler.update('favorites', favorites);
  }

  @override
  Future<void> removeFromFavorites(String id) async {
    final favorites = await fetchFavorites();
    favorites.removeWhere((f) => f == id);
    await dbHandler.update('favorites', favorites);
  }
}
