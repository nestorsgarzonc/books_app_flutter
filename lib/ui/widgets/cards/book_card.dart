import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.title,
    required this.onTap,
    this.imgUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? imgUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: 190,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 0.5)],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: imgUrl != null
                  ? Image.network(imgUrl!, fit: BoxFit.cover)
                  : Image.asset(
                      'assets/images/book_cover.png',
                      fit: BoxFit.cover,
                    ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
