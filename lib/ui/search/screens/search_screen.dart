import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_books/core/enums/search_enums.dart';
import 'package:flutter_books/features/search/bloc/search_bloc.dart';
import 'package:flutter_books/ui/widgets/cards/book_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const route = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _textController = TextEditingController();
  SearchEnums option = SearchEnums.title;
  bool isSearching = false;
  String lastQuery = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(textListener);
  }

  @override
  void dispose() {
    super.dispose();
    _textController.removeListener(textListener);
    _textController.dispose();
  }

  Future<void> textListener() async {
    if (isSearching) {
      return;
    }
    isSearching = true;
    final String text = _textController.text.trim();
    await Future.delayed(const Duration(seconds: 1));
    isSearching = false;
    if (text.isEmpty || text == lastQuery) {
      return;
    }
    lastQuery = text;
    BlocProvider.of<SearchBloc>(context).add(SearchBook(
      author: option == SearchEnums.author ? text : null,
      title: option == SearchEnums.title ? text : null,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => option = SearchEnums.title),
                    style: ElevatedButton.styleFrom(
                      primary: option == SearchEnums.title
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                    child: Text(
                      'Title',
                      style: TextStyle(
                          color: option == SearchEnums.title ? Colors.white : Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => option = SearchEnums.author),
                    child: Text(
                      'Author',
                      style: TextStyle(
                          color: option == SearchEnums.author ? Colors.white : Colors.black54),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: option == SearchEnums.author
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(label: Text('Search...')),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.books != null) {
                  if ((state.books!.docs ?? []).isEmpty) {
                    return const Center(child: Text('Oops not found :c'));
                  }
                  return Expanded(
                    child: GridView.builder(
                      itemCount: state.books!.docs!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1 / 2,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, i) {
                        final item = state.books!.docs![i];
                        return BookCard(
                          id: i.toString(),
                          book: item,
                        );
                      },
                    ),
                  );
                }
                if (state.failure != null) {
                  return const Center(child: Text('Search failed'));
                }
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Search...'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
