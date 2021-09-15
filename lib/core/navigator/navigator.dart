import 'package:flutter/material.dart';
import 'package:flutter_library/ui/favourites/screens/book_details.dart';
import 'package:flutter_library/ui/favourites/screens/list_favourites_books.dart';
import 'package:flutter_library/ui/home/screens/home_screen.dart';
import 'package:flutter_library/ui/search/screens/search_screen.dart';

class CustomNavigator {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case SearchScreen.route:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case ListFavouritesBooks.route:
        return MaterialPageRoute(builder: (context) => const ListFavouritesBooks());
      case BookDetails.route:
        final args = routeSettings.arguments as BookDetailsArgs;
        return MaterialPageRoute(builder: (context) => BookDetails(bookId: args.bookId));
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
