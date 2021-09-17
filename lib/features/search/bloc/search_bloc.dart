import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_library/core/failure/failure.dart';
import 'package:flutter_library/features/search/models/book_model.dart';
import 'package:flutter_library/features/search/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(SearchInitial());

  final ISearchRepository searchRepository;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchBook) {
      yield* searchEventToState(event);
    }
  }

  Stream<SearchState> searchEventToState(SearchBook event) async* {
    yield SearchLoading();
    final res = await searchRepository.search(event.author, event.title);
    yield res.fold(
      (l) => SearchError(l),
      (r) => SearchLoaded(r),
    );
  }
}
