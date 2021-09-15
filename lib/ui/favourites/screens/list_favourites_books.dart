import 'package:flutter/material.dart';
import 'package:flutter_library/ui/favourites/screens/book_details.dart';
import 'package:flutter_library/ui/widgets/cards/book_card.dart';

class ListFavouritesBooks extends StatelessWidget {
  const ListFavouritesBooks({Key? key}) : super(key: key);
  static const route = 'ListFavouritesBooks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites books')),
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
              onTap: () => handleOnTapBook(context, '$i'),
              title: 'NW Title',
            );
          },
        ),
      ),
    );
  }

  void handleOnTapBook(BuildContext context, String id) {
    Navigator.of(context).pushNamed(BookDetails.route, arguments: BookDetailsArgs(bookId: id));
  }
}
