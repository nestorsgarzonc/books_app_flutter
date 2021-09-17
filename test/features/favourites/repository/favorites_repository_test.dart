import 'package:flutter_books/core/failure/failure.dart';
import 'package:flutter_books/features/favorites/datasources/favorites_datasource.dart';
import 'package:flutter_books/features/favorites/repository/favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorites_repository_test.mocks.dart';

@GenerateMocks([IFavoriteDatasource])
void main() {
  final favoriteDatasource = MockIFavoriteDatasource();
  final favoritesRepository = FavoriteRepository(favoriteDatasource);
  group('FavoritesRepository testing', () {
    test('Should fetch empty when fetchFavorites', () async {
      when(favoriteDatasource.fetchFavorites()).thenAnswer((_) async => []);
      final res = await favoritesRepository.fetchFavorites();
      verify(favoritesRepository.fetchFavorites());
      expect(res.isRight(), true);
      expect(res.isLeft(), false);
      final data = res.fold((l) => l, (r) => r);
      expect(data, []);
    });

    test('Should fetch elements when fetchFavorites', () async {
      const elements = ['a', 'b', 'c'];
      when(favoriteDatasource.fetchFavorites()).thenAnswer((_) async => elements);
      final res = await favoritesRepository.fetchFavorites();
      verify(favoritesRepository.fetchFavorites());
      expect(res.isRight(), true);
      expect(res.isLeft(), false);
      final data = res.fold((l) => l, (r) => r);
      expect(data, elements);
    });

    test('Should throw an exception when fetchFavorites', () async {
      final exception = HiveError('message');
      when(favoriteDatasource.fetchFavorites()).thenThrow(exception);
      final res = await favoritesRepository.fetchFavorites();
      verify(favoritesRepository.fetchFavorites());
      expect(res.isRight(), false);
      expect(res.isLeft(), true);
      final data = res.fold((l) => l, (r) => r);
      expect((data as Failure).message, Failure(message: exception.toString()).message);
    });

    test('Should call addToFavorites', () async {
      const id = 'asdasrq23';
      when(favoriteDatasource.addToFavorites(id)).thenAnswer((_) async {});
      await favoritesRepository.addToFavorites(id);
      verify(favoritesRepository.addToFavorites(id));
    });

    test('Should call removeFromFavorites', () async {
      const id = 'awero';
      when(favoriteDatasource.removeFromFavorites(id)).thenAnswer((_) async {});
      await favoritesRepository.removeFromFavorites(id);
      verify(favoritesRepository.removeFromFavorites(id));
    });
  });
}
