import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_library/ui/widgets/cards/book_card.dart';

class ListFavoritesBooks extends StatelessWidget {
  const ListFavoritesBooks({Key? key}) : super(key: key);
  static const route = 'ListFavoritesBooks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites books')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesInitial) {
              BlocProvider.of<FavoritesBloc>(context).add(FetchFavoritesEvent());
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoritesLoaded) {
              if (state.favorites.isEmpty) {
                return const Center(child: Text('No favorites yet :c'));
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 2,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.favorites.length,
                itemBuilder: (context, i) {
                  final item = state.favorites[i];
                  return BookCard(id: item);
                },
              );
            }
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoritesFailure) {
              return Center(child: Text(state.failure.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
