import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_books/core/failure/failure.dart';
import 'package:flutter_books/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_books/features/favorites/repository/favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorites_bloc_test.mocks.dart';

@GenerateMocks([FavoriteRepository])
main() {
  final favoriteRepository = MockFavoriteRepository();
  group('FavoritesBloc testing', () {
    blocTest(
      'Should emit InitialState',
      build: () => FavoritesBloc(favoriteRepository),
      expect: () => [],
    );

    blocTest(
      'Should start loading when FavoritesInitial',
      build: () => FavoritesBloc(favoriteRepository),
      act: (FavoritesBloc bloc) => bloc..add(FetchFavoritesEvent()),
      expect: () => [FavoritesLoading()],
    );

    const failure = Failure(message: 'asd');
    blocTest(
      'Should start loading when FavoritesInitial',
      build: () => FavoritesBloc(favoriteRepository),
      act: (FavoritesBloc bloc) {
        when(favoriteRepository.fetchFavorites()).thenAnswer((_) async => left(failure));
        bloc.add(FetchFavoritesEvent());
      },
      wait: const Duration(milliseconds: 500),
      skip: 1,
      expect: () => const [FavoritesFailure(failure)],
    );

    blocTest(
      'Should not emit events when SaveFavoritesEvent',
      build: () => FavoritesBloc(favoriteRepository),
      act: (FavoritesBloc bloc) {
        when(favoriteRepository.removeFromFavorites('asd')).thenAnswer((_) async {});
        when(favoriteRepository.fetchFavorites()).thenAnswer((_) async => left(failure));
        bloc.add(const SaveFavoritesEvent('asd'));
      },
      wait: const Duration(milliseconds: 500),
      expect: () => const [],
    );
  });
}
