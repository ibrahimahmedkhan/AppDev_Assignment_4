class Book {
  String bookName;
  List<String> authors;
  String ISBN;
  String publisherName;
  String url;
  bool isFavorite;

  Book(
      {required this.bookName,
      required this.publisherName,
      required this.authors,
      required this.url,
      required this.isFavorite,
      this.ISBN = '0'});

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
        bookName: json['bookName'] as String? ?? 'field empty',
        publisherName: json['publisherName'] as String? ?? 'field empty',
        authors: List<String>.from(json['authors'] ?? []),
        url: json['url'] as String? ?? 'field empty',
        ISBN: json['ISBN'] as String? ?? 'field empty',
        isFavorite: json['isFavorite'] as bool? ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'bookName': bookName,
      'publisherName': publisherName,
      'authors': authors,
      'url': url,
      'ISBN': ISBN,
      'isFavorite': isFavorite
    };
  }
}
