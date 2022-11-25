import 'package:assignment_4/book/book.dart';
import 'package:assignment_4/book/book_repository.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  List<Book> books = [];

  final BookRepository _bookRepository = FirebaseBookRepository();

  fetchBooks() async {
    books = await _bookRepository.fetchBooksList();
    notifyListeners();
  }
}
