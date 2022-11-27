import 'package:assignment_4/book/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_provider.dart';

class BookListTile extends StatefulWidget {
  const BookListTile({Key? key, required this.book, required this.onTap})
      : super(key: key);
  final Book book;
  final void Function(Book book) onTap;

  @override
  State<BookListTile> createState() => _BookListTileState();
}

class _BookListTileState extends State<BookListTile> {
  updateData(Book book) {
    final db = FirebaseFirestore.instance;
    setState(() {
      db
          .collection('books')
          .doc(book.ISBN)
          .update({'isFavorite': book.isFavorite});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => widget.onTap(widget.book),
      leading: CircleAvatar(
          backgroundImage: widget.book.url.toString().substring(0, 4) == 'http'
              ? NetworkImage(widget.book.url)
              : null),
      title: Text(widget.book.bookName),
      subtitle: Text(widget.book.authors[0] as String? ?? 'aa'),
      trailing: IconButton(
        onPressed: () {
          context.read<BookProvider>().fetchBooks();
          widget.book.isFavorite = !widget.book.isFavorite;
          updateData(widget.book);
        },
        icon: const Icon(Icons.favorite),
        color: widget.book.isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
