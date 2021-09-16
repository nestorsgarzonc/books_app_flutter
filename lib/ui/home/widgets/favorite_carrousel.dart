import 'package:flutter/material.dart';
import 'package:flutter_library/ui/favorites/screens/book_details.dart';
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
        SizedBox(
          height: 360,
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, _) => const SizedBox(width: 10),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              if (i == 0) {
                return const SizedBox(width: 8);
              }
              return BookCard(
                id: '$i',
                onTap: () => handleOnTapBook(context, '$i'),
                title: 'NW Title',
              );
            },
          ),
        ),
      ],
    );
  }

  void handleOnTapMyFav(BuildContext context) {
    Navigator.of(context).pushNamed(ListFavoritesBooks.route);
  }

  void handleOnTapBook(BuildContext context, String id) {
    Navigator.of(context).pushNamed(BookDetails.route, arguments: BookDetailsArgs(bookId: id));
  }
}
