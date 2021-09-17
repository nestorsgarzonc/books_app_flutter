import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_library/core/failure/failure.dart';
import 'package:flutter_library/features/search/models/book_model.dart';
import 'package:flutter_library/features/search/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(const SearchState());

  final ISearchRepository searchRepository;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchBook) {
      yield* searchEventToState(event);
    } else if (event is SearchBookById) {
      yield* searchByIdEventToState(event);
    }
  }

  Stream<SearchState> searchEventToState(SearchBook event) async* {
    yield state.copyWith(isLoading: true);
    final res = await searchRepository.search(event.author, event.title);
    yield res.fold(
      (l) => state.copyWith(isLoading: false, failure: l),
      (r) => state.copyWith(isLoading: false, books: r),
    );
  }

  Stream<SearchState> searchByIdEventToState(SearchBookById event) async* {
    yield state.copyWith(isLoading: true);
    final res = await searchRepository.searchById(event.id!);
    yield res.fold(
      (l) => state.copyWith(isLoading: false, bookDetailFailure: l),
      (r) => state.copyWith(isLoading: false, bookDetail: r),
    );
  }

  Future<Doc?> bookDetailFuture(String id) async {
    final res = await searchRepository.searchById(id);
    return res.fold(
      (l) => null,
      (r) => r.docs?.first,
    );
  }
}
