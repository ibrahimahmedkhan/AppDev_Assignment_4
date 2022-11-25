import 'package:assignment_4/book/book_model.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: books
          .map((book) => ListTile(
                leading: Text(book.bookName),
                trailing: Text(book.author),
              ))
          .toList(),
    );
  }
}
