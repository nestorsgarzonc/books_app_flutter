import 'package:dartz/dartz.dart';
import 'package:flutter_library/core/failure/failure.dart';
import 'package:flutter_library/features/search/datasources/search_datasource.dart';
import 'package:flutter_library/features/search/models/book_model.dart';

abstract class ISearchRepository {
  Future<Either<Failure, Books>> search(String? author, String? book);
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
}
