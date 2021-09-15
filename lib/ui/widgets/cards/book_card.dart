import 'package:flutter/material.dart';
import 'package:flutter_library/ui/widgets/image/custom_network_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    required this.title,
    required this.onTap,
    required this.id,
    this.imgUrl,
    Key? key,
    this.axis = Axis.vertical,
  }) : super(key: key);

  final String title;
  final String? imgUrl;
  final VoidCallback onTap;
  final String id;
  final Axis axis;

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
        child: Flex(
          direction: axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: axis == Axis.horizontal ? 150 : null,
              child: Hero(
                child: CustomNewtorkImage(imgUrl: imgUrl),
                tag: id,
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
