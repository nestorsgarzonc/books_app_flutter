import 'package:flutter/material.dart';
import 'package:flutter_library/ui/home/screens/custom_appbar.dart';
import 'package:flutter_library/ui/home/widgets/favourite_carrousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(),
          SizedBox(height: 10),
          FavouritesCarrousel(),
        ],
      ),
    );
  }
}
