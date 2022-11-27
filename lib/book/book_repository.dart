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
