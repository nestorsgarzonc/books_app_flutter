import 'package:flutter/material.dart';
import 'package:flutter_library/features/search/models/book_model.dart';
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 1 / 2,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, i) {
            return BookCard(
              id: '$i',
              //TODO: FINISH
              book: Doc(),
            );
          },
        ),
      ),
    );
  }
}
