part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

// Initial state when no books are loaded
class BookInitial extends BookState {}

// State representing loaded books
class BookLoaded extends BookState {
  final List<Book> books;

  const BookLoaded(this.books);

  @override
  List<Object?> get props => [books];
}
