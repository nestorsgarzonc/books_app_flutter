import 'package:flutter/material.dart';

class CustomNewtorkImage extends StatelessWidget {
  const CustomNewtorkImage({Key? key, this.imgUrl}) : super(key: key);

  final String? imgUrl;
  static const _placeholder = 'assets/images/book_cover.png';

  @override
  Widget build(BuildContext context) {
    return imgUrl != null
        ? Image.network(
            imgUrl!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Image.asset(_placeholder, fit: BoxFit.cover);
            },
          )
        : Image.asset('assets/images/book_cover.png', fit: BoxFit.cover);
  }
}
