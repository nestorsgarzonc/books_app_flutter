import 'package:flutter/material.dart';
import 'package:flutter_library/features/search/models/book_model.dart';
import 'package:flutter_library/ui/favorites/screens/book_details.dart';
import 'package:flutter_library/ui/widgets/image/custom_network_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    this.onTap,
    required this.id,
    required this.book,
    this.imgUrl,
    Key? key,
    this.axis = Axis.vertical,
  }) : super(key: key);

  final String? imgUrl;
  final VoidCallback? onTap;
  final String id;
  final Axis axis;
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 0.5)],
          color: Colors.white,
        ),
        child: Flex(
          direction: axis,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 190,
              child: CustomNewtorkImage(imgUrl: imgUrl),
            ),
            Flexible(
              child: Text(
                book.title ?? '',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
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
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
            const SizedBox(),
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
