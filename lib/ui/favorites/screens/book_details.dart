import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_books/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_books/features/search/bloc/search_bloc.dart';
import 'package:flutter_books/features/search/models/book_model.dart';
import 'package:flutter_books/ui/widgets/image/custom_network_image.dart';

class BookDetailsArgs {
  final String bookId;
  final Doc? book;

  const BookDetailsArgs({this.book, required this.bookId});

  @override
  String toString() => 'BookDetailsArgs(bookId: $bookId)';
}

class BookDetails extends StatefulWidget {
  const BookDetails({Key? key, required this.bookId, this.book}) : super(key: key);

  static const route = '/book-details';
  final String bookId;
  final Doc? book;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    super.initState();
    if (widget.book == null) {
      BlocProvider.of<SearchBloc>(context).add(SearchBookById(id: widget.bookId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: widget.book == null
          ? BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.bookDetailFailure != null) {
                  return const Center(child: Text('Book Details Failed'));
                }
                if (state.bookDetail?.docs?.isEmpty ?? true) {
                  return const Center(child: Text('Book Details Failed'));
                }
                return _BookDetailBody(bookId: widget.bookId, book: state.bookDetail!.docs!.first);
              },
            )
          : _BookDetailBody(bookId: widget.bookId, book: widget.book),
    );
  }
}

class _BookDetailBody extends StatelessWidget {
  const _BookDetailBody({Key? key, required this.bookId, this.book}) : super(key: key);

  final String bookId;
  final Doc? book;

  @override
  Widget build(BuildContext context) {
    final hasIsbn = book?.isbn != null || (book?.isbn ?? []).isNotEmpty;
    final _id = hasIsbn ? (book?.isbn!.first ?? '') : bookId;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 240,
                  width: constraints.maxWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.35,
                        child: CustomNewtorkImage(
                          imgUrl:
                              hasIsbn ? 'http://covers.openlibrary.org/b/isbn/$_id-M.jpg' : null,
                        ),
                      ),
                      const SizedBox(width: 2),
                      SizedBox(
                        width: constraints.maxWidth * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book?.title ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              book?.authorName?.first ?? '',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${book?.publishYear?.first ?? ''}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (_) => const Icon(Icons.star, color: Colors.orange),
                                ).toList(),
                                const SizedBox(width: 5),
                                const Text('5/5'),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              width: constraints.maxWidth * 0.4,
                              height: 40,
                              child: FavouriteButton(id: _id),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BookDetailsItem(
                  title: 'Subject',
                  content: book?.subject?.join(', '),
                ),
                BookDetailsItem(
                  title: 'Overview',
                  content: book?.text?.join(', '),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesInitial) {
          BlocProvider.of<FavoritesBloc>(context).add(FetchFavoritesEvent());
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavoritesLoaded) {
          final isInFavorites = state.favorites.contains(id);
          return ElevatedButton(
            onPressed: () {
              if (isInFavorites) {
                BlocProvider.of<FavoritesBloc>(context).add(RemoveFavoriteEvent(id));
              } else {
                BlocProvider.of<FavoritesBloc>(context).add(SaveFavoritesEvent(id));
              }
            },
            child: Row(
              children: [
                Icon(isInFavorites ? Icons.favorite : Icons.favorite_border),
                const SizedBox(width: 5),
                Flexible(child: Text(isInFavorites ? 'Remove from favorites' : 'Add to favorites')),
              ],
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
    );
  }
}

class BookDetailsItem extends StatelessWidget {
  const BookDetailsItem({Key? key, this.title, this.content}) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(
          content ?? '',
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
