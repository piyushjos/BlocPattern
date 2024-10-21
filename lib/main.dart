import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/screens/home_screen.dart'; // Ensure correct path
import 'bloc/book_bloc.dart'; // Import the BookBloc

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => BookBloc()..add(LoadBooks()), // Provide BookBloc
        child: HomePage(), // Use const where possible
      ),
    );
  }
}
