import 'package:flutter_library/core/api/request_handler.dart';
import 'package:flutter_library/features/search/models/book_model.dart';

abstract class ISearchDatasource {
  Future<Books> search(String? author, String? book);
}

class SearchDatasource implements ISearchDatasource {
  SearchDatasource(this.requestHandler);

  final IRequestHandler requestHandler;

  @override
  Future<Books> search(String? author, String? book) async {
    String endpoint;
    if (author != null) {
      endpoint = 'http://openlibrary.org/search.json?author=$author';
    } else if (book != null) {
      endpoint = 'http://openlibrary.org/search.json?book=$book';
    } else {
      throw Exception('Invalid search parameters');
    }
    final response = await requestHandler.makeGet(endpoint);
    return booksFromJson(response.body);
  }
}
