import 'package:flutter/material.dart';
import 'package:flutter_library/ui/favorites/screens/book_details.dart';
import 'package:flutter_library/ui/widgets/cards/book_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const route = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Search by name or author...')),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, _) => const SizedBox(height: 15),
                itemBuilder: (context, i) {
                  return BookCard(
                    id: '$i',
                    onTap: () => handleOnTapBook(context, '$i'),
                    title: 'NW Title',
                    axis: Axis.horizontal,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleOnTapBook(BuildContext context, String id) {
    Navigator.of(context).pushNamed(BookDetails.route, arguments: BookDetailsArgs(bookId: id));
  }
}
