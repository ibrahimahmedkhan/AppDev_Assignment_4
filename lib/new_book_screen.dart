import 'package:assignment_4/book/book_model.dart';
import 'package:assignment_4/multi_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewBookScreen extends StatefulWidget {
  const NewBookScreen({Key? key}) : super(key: key);

  @override
  State<NewBookScreen> createState() => _NewBookScreenState();
}

class _NewBookScreenState extends State<NewBookScreen> {
  late TextEditingController bookNameController;
  late TextEditingController authorController;
  late TextEditingController publisherNameController;
  late TextEditingController urlController;
  late TextEditingController ISBNController;
  late List<TextEditingController> authorControllers;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bookNameController = TextEditingController();
    authorController = TextEditingController();
    publisherNameController = TextEditingController();
    urlController = TextEditingController();
    ISBNController = TextEditingController();
    authorControllers = List<TextEditingController>.empty(growable: true);
  }

  postData(Book book) {
    db.collection('books').doc(book.ISBN).set(book.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bookNameController,
                    decoration: const InputDecoration(
                        hintText: 'Harry Potter', labelText: 'Book name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: authorController,
                    decoration: const InputDecoration(
                        hintText: 'J.K Rowling', labelText: 'Author'),
                  ),
                ),
                MultiTextField(
                  textEditingControllers: authorControllers,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: publisherNameController,
                    decoration: const InputDecoration(
                        hintText: 'publisher name', labelText: 'Publisher'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: urlController,
                    decoration: const InputDecoration(
                        hintText: 'https://as', labelText: 'Image'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ISBNController,
                    decoration: const InputDecoration(
                        hintText: '12012901930', labelText: 'ISBN'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      postData(Book(
                          bookName: bookNameController.value.text,
                          authors: authorControllers.map((authorController) {
                            return authorController.value.text;
                          }).toList(),
                          publisherName: publisherNameController.value.text,
                          url: urlController.value.text,
                          ISBN: ISBNController.value.text,
                          isFavorite: false));
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
