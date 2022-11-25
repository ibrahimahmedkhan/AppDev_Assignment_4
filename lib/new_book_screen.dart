import 'package:assignment_4/book/book_model.dart';
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

    bookNameController.addListener(() {
      setState(() {});
    });
    authorController.addListener(() {
      setState(() {});
    });
    publisherNameController.addListener(() {
      setState(() {});
    });
    urlController.addListener(() {
      setState(() {});
    });
    ISBNController.addListener(() {
      setState(() {});
    });
  }

  postData(Book book) {
    db.collection('books').add(book.toJson()).then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: bookNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: authorController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: publisherNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: urlController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ISBNController,
                ),
              ),
              TextButton(
                  onPressed: () => postData(Book(
                        bookName: bookNameController.value.text,
                        author: authorController.value.text,
                        publisherName: publisherNameController.value.text,
                        url: urlController.value.text,
                        ISBN: ISBNController.value.text,
                      )),
                  child: Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
