import 'package:flutter_library/core/api/request_handler.dart';
import 'package:flutter_library/features/search/models/book_model.dart';

abstract class ISearchDatasource {
  Future<Books> search(String? author, String? book);
  Future<Books> searchById(String id);
}

class SearchDatasource implements ISearchDatasource {
  SearchDatasource(this.requestHandler);

  final IRequestHandler requestHandler;

  @override
  Future<Books> search(String? author, String? book) async {
    String endpoint;
    if (author != null) {
      endpoint = '/search.json?author=$author';
    } else if (book != null) {
      endpoint = '/search.json?title=$book';
    } else {
      throw Exception('Invalid search parameters');
    }
    endpoint += '&limit=10';
    final response = await requestHandler.makeGet(endpoint);
    return booksFromJson(response.body);
  }

  @override
  Future<Books> searchById(String id) async {
    final endpoint = '/search.json?isbn=$id';
    final response = await requestHandler.makeGet(endpoint);
    return booksFromJson(response.body);
  }
}
