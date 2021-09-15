import 'package:flutter/material.dart';

import 'package:flutter_library/ui/widgets/image/custom_network_image.dart';

class BookDetailsArgs {
  final String bookId;

  const BookDetailsArgs({required this.bookId});

  @override
  String toString() => 'BookDetailsArgs(bookId: $bookId)';
}

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key, required this.bookId}) : super(key: key);

  static const route = '/book-details';
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 240,
                  child: Row(
                    children: [
                      Hero(
                        child: const CustomNewtorkImage(),
                        tag: bookId,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
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
                          const SizedBox(height: 20),
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite),
                                  SizedBox(width: 5),
                                  Flexible(child: Text('Add to favourites')),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(Icons.book),
                                  SizedBox(width: 5),
                                  Text('Buy'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Synopsis',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
