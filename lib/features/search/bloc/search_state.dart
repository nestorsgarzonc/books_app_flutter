part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final Books? books;
  final Books? bookDetail;
  final Failure? failure;
  final Failure? bookDetailFailure;

  const SearchState({
    this.isLoading = false,
    this.books,
    this.bookDetail,
    this.failure,
    this.bookDetailFailure,
  });

  @override
  List<Object> get props => [isLoading];

  SearchState copyWith({
    bool? isLoading,
    Books? books,
    Books? bookDetail,
    Failure? failure,
    Failure? bookDetailFailure,
  }) =>
      SearchState(
        isLoading: isLoading ?? this.isLoading,
        books: books ?? this.books,
        bookDetail: bookDetail ?? this.bookDetail,
        failure: failure ?? this.failure,
        bookDetailFailure: bookDetailFailure ?? this.bookDetailFailure,
      );
}
