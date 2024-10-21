import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:uuid/uuid.dart';
import 'dart:math' as math;

import '../model/Book.dart';

const List<String> colors = [
  "green",
  "red",
  "orange",
  "yellow",
  "blue",
  "pink",
  "cyan",
  "magenta",
  "coral",
  "brown"
];
const List<String> imageUrls = [
  'https://picsum.photos/id/237/200/300',
  'https://picsum.photos/id/238/200/300',
  'https://picsum.photos/id/239/200/300',
  'https://picsum.photos/id/240/200/300',
  'https://picsum.photos/id/241/200/300',
  'https://picsum.photos/id/242/200/300',
];

class Mock {
  static String firstName() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String lastName() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String title() {
    return lorem(paragraphs: 1, words: 3).replaceAll(".", "");
  }

  static String uid() {
    return Uuid().v4(); 
  }

    static String imageUrl() {
    return imageUrls[math.Random().nextInt(imageUrls.length)];
  }

  static String description() {
    return lorem(paragraphs: 1, words: 50)
        .replaceAll(".", ""); // Generate a random description
  }

  // New method to create a mock book
  static Book createMockBook() {
    return Book(
      title: title(),
      author:
          "${firstName()} ${lastName()}", // Combine first and last names for the author
      imageUrl: imageUrl(), // Generate a random image URL
      uid: uid(), // Generate a unique ID
      description: description(), // Generate a random description
    );
  }
}
