import 'package:flutter/material.dart';
import 'package:flutter_library/ui/widgets/image/custom_network_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.title,
    required this.onTap,
    required this.id,
    this.imgUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? imgUrl;
  final VoidCallback onTap;
  final String id;

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
            Hero(
              child: CustomNewtorkImage(imgUrl: imgUrl),
              tag: id,
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
