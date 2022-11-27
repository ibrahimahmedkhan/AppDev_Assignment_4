import 'package:cloud_firestore/cloud_firestore.dart';

import 'book_model.dart';

abstract class BookRepository {
  Future<List<Book>> fetchBooksList();
}

class FirebaseBookRepository implements BookRepository {
  @override
  Future<List<Book>> fetchBooksList() async {
    final db = FirebaseFirestore.instance;
    List<Book> books = [];
    await db.collection("books").get().then((event) {
      books = event.docs.map((book) => Book.fromJson(book.data())).toList();
      return books;
    });
    return books;
  }
}

class MockBookRepository implements BookRepository {
  @override
  Future<List<Book>> fetchBooksList() async {
    List<Book> books = [
      // Book(bookName: 'Akunamatata', author: 'Roald Dahle', ISBN: '1'),
      // Book(bookName: 'The first book', author: 'Ibrahim', ISBN: '2'),
      // Book(bookName: 'Only if you knew', author: 'Ahris', ISBN: '3'),
      // Book(bookName: 'Clockwork princess', author: 'Ashad Nadeem', ISBN: '4')
    ];
    return books;
  }
}
