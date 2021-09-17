part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<String> favorites;

  const FavoritesLoaded(this.favorites);
}

class FavoritesFailure extends FavoritesState {
  final Failure failure;

  const FavoritesFailure(this.failure);
}
