import 'dart:convert';
import '../services/mock.dart';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String uid;
  final String description; // New description field

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.uid,
    required this.description, // Include description in the constructor
  });

  Book copyWith({
    String? title,
    String? author,
    String? imageUrl,
    String? uid,
    String? description, // Include description in copyWith
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      uid: uid ?? this.uid,
      description:
          description ?? this.description, // Handle description in copyWith
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'uid': uid,
      'description': description, // Add description to the map
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] as String,
      author: map['author'] as String,
      imageUrl: map['imageUrl'] as String,
      uid: map['uid'] as String,
      description:
          map['description'] as String, // Retrieve description from the map
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  static Book createMockBook() {
    return Book(
      title: Mock.title(), // Create a title using the Mock class
      author: Mock.firstName() +
          ' ' +
          Mock.lastName(), // Combine first and last name for author
      imageUrl: Mock.imageUrl(), // Get a random image URL
      uid: Mock.uid(), // Generate a unique ID
      description: Mock.description(), // Generate a random description
    );
  }

  @override
  String toString() {
    return 'Book(title: $title, author: $author, imageUrl: $imageUrl, uid: $uid, description: $description)'; // Include description in the string representation
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.author == author &&
        other.imageUrl == imageUrl &&
        other.uid == uid &&
        other.description == description; // Compare descr
  }
}
