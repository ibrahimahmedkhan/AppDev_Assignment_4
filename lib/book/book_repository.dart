import 'package:cloud_firestore/cloud_firestore.dart';

import 'book.dart';

abstract class BookRepository {
  Future<List<Book>> fetchBooksList();
}

class FirebaseBookRepository implements BookRepository {
  @override
  Future<List<Book>> fetchBooksList() async {
    final db = FirebaseFirestore.instance;
    List<Book> books = [];
    await db.collection("books").get().then((event) {
      books = event.docs.map((e) => Book.fromJson(e.data(), e.id)).toList();
      return books;
    });
    return books;
  }
}

class MockBookRepository implements BookRepository {
  @override
  Future<List<Book>> fetchBooksList() async {
    List<Book> books = [
      Book(name: 'Akunamatata', author: 'Roald Dahle'),
      Book(name: 'The first book', author: 'Ibrahim'),
      Book(name: 'Only if you knew', author: 'Ahris'),
      Book(name: 'Clockwork princess', author: 'Ashad Nadeem')
    ];
    return books;
  }
}
