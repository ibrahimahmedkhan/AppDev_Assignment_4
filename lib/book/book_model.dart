class Book {
  String bookName;
  String author;
  String ISBN;
  String publisherName;
  String url;

  Book(
      {required this.bookName,
      required this.publisherName,
      required this.author,
      required this.url,
      this.ISBN = '0'});

  static Book fromJson(Map<String, dynamic> json, String id) {
    return Book(
        bookName: json['bookName'] as String? ?? 'field empty',
        publisherName: json['publisherName'] as String? ?? 'field empty',
        author: json['author'] as String? ?? 'field empty',
        url: json['url'] as String? ?? 'field empty',
        ISBN: id);
  }

  Map<String, dynamic> toJson({bool excludeId = true}) {
    return {
      'bookName': bookName,
      'publisherName': publisherName,
      'author': author,
      'url': url,
      'id': ISBN
    };
  }
}
