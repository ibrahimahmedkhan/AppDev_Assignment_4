import 'package:assignment_4/book/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundImage: book.url.toString().contains('http')
                      ? NetworkImage(book.url)
                      : null),
              ListTile(
                  title: Text('Book Name'),
                  subtitle: Text(
                    book.bookName,
                  )),
              Column(
                children: book.authors.isNotEmpty
                    ? book.authors.map((author) => Text(author)).toList()
                    : [Text('')],
              ),
              ListTile(
                  title: Text('Publisher Name'),
                  subtitle: Text(
                    book.publisherName,
                  )),
              ListTile(
                  title: Text('ISBN'),
                  subtitle: Text(
                    book.ISBN,
                  )),
              Icon(
                Icons.favorite,
                color: book.isFavorite ? Colors.red : Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
