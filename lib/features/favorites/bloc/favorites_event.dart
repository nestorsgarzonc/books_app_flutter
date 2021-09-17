part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoritesEvent extends FavoritesEvent {}

class SaveFavoritesEvent extends FavoritesEvent {
  final String id;

  const SaveFavoritesEvent(this.id);
}

class RemoveFavoriteEvent extends FavoritesEvent {
  final String id;

  const RemoveFavoriteEvent(this.id);
}

