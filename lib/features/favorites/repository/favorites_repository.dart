import 'package:dartz/dartz.dart';
import 'package:flutter_library/core/failure/failure.dart';
import 'package:flutter_library/features/favorites/datasources/favorites_datasource.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, List<String>>> fetchFavorites();
  Future<Failure?> addToFavorites(String id);
  Future<Failure?> removeFromFavorites(String id);
}

class FavoriteRepository extends IFavoriteRepository {
  FavoriteRepository(this.favoriteDatasource);

  final IFavoriteDatasource favoriteDatasource;

  @override
  Future<Failure?> addToFavorites(String id) async {
    try {
      await favoriteDatasource.addToFavorites(id);
      return null;
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchFavorites() async {
    try {
      final res = await favoriteDatasource.fetchFavorites();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Failure?> removeFromFavorites(String id) async {
    try {
      await favoriteDatasource.removeFromFavorites(id);
      return null;
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
