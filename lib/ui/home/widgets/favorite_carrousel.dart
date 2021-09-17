import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_library/ui/favorites/screens/list_favourites_books.dart';
import 'package:flutter_library/ui/widgets/cards/book_card.dart';

class FavoritesCarrousel extends StatelessWidget {
  const FavoritesCarrousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
            onPressed: () => handleOnTapMyFav(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My favorites',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
                ),
                IconButton(
                  onPressed: () => handleOnTapMyFav(context),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesInitial) {
              BlocProvider.of<FavoritesBloc>(context).add(FetchFavoritesEvent());
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoritesLoaded) {
              if (state.favorites.isEmpty) {
                return const Center(child: Text('No favorites yet :c'));
              }
              return SizedBox(
                height: 400,
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, _) => const SizedBox(width: 10),
                  itemCount: state.favorites.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    final item = state.favorites[i];
                    return BookCard(id: item);
                  },
                ),
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
      ],
    );
  }

  void handleOnTapMyFav(BuildContext context) {
    Navigator.of(context).pushNamed(ListFavoritesBooks.route);
  }
}
