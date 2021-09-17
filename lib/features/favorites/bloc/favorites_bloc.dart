import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_books/core/failure/failure.dart';
import 'package:flutter_books/features/favorites/repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this.favoritesRepository) : super(FavoritesInitial());

  final IFavoriteRepository favoritesRepository;

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FetchFavoritesEvent) {
      yield FavoritesLoading();
      final res = await favoritesRepository.fetchFavorites();
      yield res.fold(
        (l) => FavoritesFailure(l),
        (r) => FavoritesLoaded(r),
      );
    } else if (event is SaveFavoritesEvent) {
      await favoritesRepository.addToFavorites(event.id);
      add(FetchFavoritesEvent());
    } else if (event is RemoveFavoriteEvent) {
      await favoritesRepository.removeFromFavorites(event.id);
      add(FetchFavoritesEvent());
    }
  }
}
