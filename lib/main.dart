import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikipedia Change Log App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const WordCounterWidget(),
    );
  }
}

class WordCounterWidget extends StatefulWidget {
  const WordCounterWidget({super.key});

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
    // final linkAddingSearch = LinkMaker();
    //final search = linkAddingSearch.linkAdder(textFieldContent);
    //setState(() {
    //_message = 'You have Searched $search';
    //_isProcessing = false;
    //});
  }
}
