import 'package:flutter/material.dart';
import 'package:flutter_books/ui/favorites/screens/book_details.dart';
import 'package:flutter_books/ui/favorites/screens/list_favourites_books.dart';
import 'package:flutter_books/ui/home/screens/home_screen.dart';
import 'package:flutter_books/ui/search/screens/search_screen.dart';

class CustomNavigator {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case SearchScreen.route:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case ListFavoritesBooks.route:
        return MaterialPageRoute(builder: (context) => const ListFavoritesBooks());
      case BookDetails.route:
        final args = routeSettings.arguments as BookDetailsArgs;
        return MaterialPageRoute(
          builder: (context) => BookDetails(bookId: args.bookId, book: args.book),
        );
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
