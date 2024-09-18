import 'package:flutter/material.dart';
import 'package:twp_roth_munchel/link.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: WordCounterWidget()),
    );
  }
}

class WordCounterWidget extends StatefulWidget {
  @override
  State<WordCounterWidget> createState() => _WordCounterWidgetState();
}

class _WordCounterWidgetState extends State<WordCounterWidget> {
  final _controller = TextEditingController();
  String _message = 'Press the button';
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 32,
        color: Colors.black,
      ),
      child: Column(
        children: [
          const Text('Please enter a URL'),
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
              onPressed: _isProcessing ? null : _onButtonPressedHitUrl,
              child: const Text('Go')),
          Text(_message),
        ],
      ),
    );
  }

  void _onButtonPressedHitUrl() {
    setState(() {
      _message = 'please wait';
      _isProcessing = true;
    });
    final textFieldContent = _controller.text;
    // Stdin.readLineSync(); is supposed to take a user input but I don't know
    final linkAddingSearch = LinkMaker();
    final search = linkAddingSearch.linkAdder('s');
    setState(() {
      _message = 'You have Searched $search';
      _isProcessing = false;
    });
  }
}
