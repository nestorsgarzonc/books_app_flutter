part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchBook extends SearchEvent {
  const SearchBook(this.title, this.author);

  final String? title;
  final String? author;
}
