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

  // we can replace this button with the other button that I made under it
  void _onButtonPressed() async {
    setState(() {
      _message = 'Please wait';
      _isProcessing = true;
    });
    final textFieldContent = _controller.text;
    final uri = Uri.parse(textFieldContent);
    final response = await http.get(uri);
    final wordCounter = WordCounter();
    final count = wordCounter.countWords(response.body);
    setState(() {
      _message = 'I found $count words';
      _isProcessing = false;
    });
  }

  void _onButtonPressedHitUrl() {
    setState(() {
      _message = 'please wait';
      _isProcessing = true;
    });
    final textFieldContent = _controller.text;
    // Stdin is supposed to take a user input but I don't know
    final response = stdin.readLineSync();
    final linkAdding = LinkMaker();
    final count = linkAdding.linkAdder();
    setState(() {
      _message = 'You have Searched $response';
      _isProcessing = false;
    });
  }
}
