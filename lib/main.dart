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
  final _finalWikipediaUrl = UriBuilder();
  final _parser = WikipediaParser();
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextField(controller: _textController),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: _onButtonPressed, child: const Text('Search')),
          ),
        ),
        _future != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<String>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final jsonEncodedResponse = snapshot.data;
                      final jsonDecoded = jsonDecode(jsonEncodedResponse!);
                      final parsedData = _parser.parse(jsonDecoded);
                      return parsedData;
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              )
            : const Text('Wikipedia Change Searcher'),
      ],
    ));
  }

  void _onButtonPressed() {
    setState(() {
      _future = http.read(
          Uri.parse(_finalWikipediaUrl.finalUrlBuilder(_textController.text)));
    });
  }
}
