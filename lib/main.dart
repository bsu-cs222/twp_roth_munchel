import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twp_roth_munchel/uri_builder.dart';
import 'wikipedia_parser.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 32),
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  WikipediaChange changeRecord =
      WikipediaChange(user: 'Example Guy', timestamp: DateTime.now());

  final _finalWikipediaUrl = UriBuilder();
  String output = '';
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(controller: _textController),
          ElevatedButton(
            onPressed: _onButtonPressed,
            child: const Text('Go'),
          ),
          WikipediaChangeWidget(changeRecord),
        ],
      ),
    );
  }

  void _onButtonPressed() async {
    final theString = await _future;
    setState(() {
      _future = http.read(
          Uri.parse(_finalWikipediaUrl.finalUrlBuilder(_textController.text)));
      final Map jsonDecoder = jsonDecode(theString!);
      final parser = WikipediaParser();
      output = (parser.parse(jsonDecoder));
    });
  }
}
