import 'package:dartz/dartz.dart';
import 'package:flutter_books/core/failure/failure.dart';
import 'package:flutter_books/features/search/datasources/search_datasource.dart';
import 'package:flutter_books/features/search/models/book_model.dart';

abstract class ISearchRepository {
  Future<Either<Failure, Books>> search(String? author, String? book);

  Future<Either<Failure, Books>> searchById(String id);
}

class SearchRepository extends ISearchRepository {
  final ISearchDatasource searchDatasource;

  SearchRepository(this.searchDatasource);

  @override
  Future<Either<Failure, Books>> search(String? author, String? book) async {
    try {
      final res = await searchDatasource.search(author, book);
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Books>> searchById(String id) async {
    try {
      final res = await searchDatasource.searchById(id);
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
