import 'package:bloc/bloc.dart';
import 'package:blocpattern/model/book.dart'; // Ensure this path is correct
import 'package:equatable/equatable.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    // Register event handlers
    on<LoadBooks>(_onLoadBooks);
    on<SortBooksByAuthor>(_onSortBooksByAuthor);
    on<SortBooksByTitle>(_onSortBooksByTitle);
  }

  // Handler for loading books
  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) {
    // Create mock books
    List<Book> books = List.generate(10, (_) => Book.createMockBook());
    emit(BookLoaded(books)); // Emit the loaded state
  }

  // Handler for sorting books by author
  void _onSortBooksByAuthor(
      SortBooksByAuthor event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final sortedBooks = List<Book>.from(currentState.books)
        ..sort((a, b) => a.author.compareTo(b.author));
      emit(BookLoaded(sortedBooks)); // Emit the sorted list
    }
  }

  // Handler for sorting books by title
  void _onSortBooksByTitle(SortBooksByTitle event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final sortedBooks = List<Book>.from(currentState.books)
        ..sort((a, b) => a.title.compareTo(b.title));
      emit(BookLoaded(sortedBooks)); // Emit the sorted list
    }
  }
}
