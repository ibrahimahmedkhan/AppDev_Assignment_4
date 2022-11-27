class Book {
  String bookName;
  String author;
  String ISBN;
  String publisherName;
  String url;
  bool isFavorite;

  Book(
      {required this.bookName,
      required this.publisherName,
      required this.author,
      required this.url,
      required this.isFavorite,
      this.ISBN = '0'});

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
        bookName: json['bookName'] as String? ?? 'field empty',
        publisherName: json['publisherName'] as String? ?? 'field empty',
        author: json['author'] as String? ?? 'field empty',
        url: json['url'] as String? ?? 'field empty',
        ISBN: json['ISBN'] as String? ?? 'field empty',
        isFavorite: json['isFavorite'] as bool? ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'bookName': bookName,
      'publisherName': publisherName,
      'author': author,
      'url': url,
      'ISBN': ISBN,
      'isFavorite': isFavorite
    };
  }
}
