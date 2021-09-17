import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/features/search/bloc/search_bloc.dart';
import 'package:flutter_library/features/search/models/book_model.dart';
import 'package:flutter_library/ui/favorites/screens/book_details.dart';
import 'package:flutter_library/ui/widgets/image/custom_network_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.id,
    this.onTap,
    this.book,
    this.imgUrl,
    Key? key,
  }) : super(key: key);

  final String? imgUrl;
  final VoidCallback? onTap;
  final String id;

  final Doc? book;

  @override
  Widget build(BuildContext context) {
    if (book == null) {
      return FutureBuilder<Doc?>(
        future: BlocProvider.of<SearchBloc>(context).bookDetailFuture(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BookCardBody(
              id: id,
              book: snapshot.data!,
              onTap: onTap,
              imgUrl: imgUrl,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    } else {
      return BookCardBody(
        id: id,
        book: book!,
        onTap: onTap,
        imgUrl: imgUrl,
      );
    }
  }
}

class BookCardBody extends StatelessWidget {
  const BookCardBody({
    Key? key,
    this.imgUrl,
    this.onTap,
    required this.id,
    required this.book,
  }) : super(key: key);

  final String? imgUrl;
  final VoidCallback? onTap;
  final String id;

  final Doc book;

  @override
  Widget build(BuildContext context) {
    final hasIsbn = book.isbn != null || (book.isbn ?? []).isNotEmpty;
    final _id = hasIsbn ? (book.isbn!.first ?? '') : id;
    final imgUrl = hasIsbn ? 'http://covers.openlibrary.org/b/isbn/$id-M.jpg' : null;

    return InkWell(
      onTap: onTap ?? () => handleOnTapBook(context, _id),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 0.5)],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CustomNewtorkImage(imgUrl: imgUrl),
            const Spacer(),
            Text(
              book.getParsedTitle(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Text(
              book.authorName?.first ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
            Text(
              '${book.publishYear?.first ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void handleOnTapBook(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      BookDetails.route,
      arguments: BookDetailsArgs(bookId: id, book: book),
    );
  }
}
