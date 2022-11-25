class Book {
  String name;
  String author;

  Book({required this.name, required this.author});

  static Book fromJson(Map<String, dynamic> json, String id) {
    return Book(name: json['name'] as String, author: json['author'] as String);
  }
}
