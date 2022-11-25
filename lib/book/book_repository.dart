import 'book.dart';

abstract class BookRepository {
  Future<List<Book>> fetchBooksList();
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
