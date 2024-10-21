part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent(); // Use const constructors for better optimization

  @override
  List<Object?> get props => []; // For comparison
}

// Event to load books
class LoadBooks extends BookEvent {}

// Event to sort books by author
class SortBooksByAuthor extends BookEvent {}

// Event to sort books by title
class SortBooksByTitle extends BookEvent {}
