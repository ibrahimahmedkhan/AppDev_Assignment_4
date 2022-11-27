import 'package:assignment_4/book/book_model.dart';
import 'package:assignment_4/book/book_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({Key? key, required this.books, required this.onTap})
      : super(key: key);

  final List<Book> books;
  final void Function(Book book) onTap;
  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  updateData(Book book) {
    final db = FirebaseFirestore.instance;
    db
        .collection('books')
        .doc(book.ISBN)
        .update({'isFavorite': book.isFavorite});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.books
          .map((book) => ListTile(
                onTap: () => widget.onTap(book),
                leading: CircleAvatar(
                    backgroundImage:
                        book.url.toString().substring(0, 4) == 'http'
                            ? NetworkImage(book.url)
                            : null),
                title: Text(book.bookName),
                subtitle: Text(book.author),
                trailing: IconButton(
                  onPressed: () {
                    context.read<BookProvider>().fetchBooks();
                    book.isFavorite = !book.isFavorite;
                    updateData(book);
                  },
                  icon: const Icon(Icons.favorite),
                  color: book.isFavorite ? Colors.red : Colors.grey,
                ),
              ))
          .toList(),
    );
  }
}

//////////////////////////////////////////////////////////////////
