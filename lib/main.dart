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
          const TitleSection(
              name: 'Search Wikiepdia ',
              location: 'Please Enter a Wikipedia Title'),
          TextField(controller: _textController),
          ElevatedButton(
            onPressed: onButtonPressed,
            child: const Text('Search'),
          ),
          WikipediaChangeWidget(changeRecord),
        ],
      ),
    );
  }

  void onButtonPressed() async {
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

class WikipediaChangeWidget extends StatelessWidget {
  final WikipediaChange changeRecord;

  const WikipediaChangeWidget(this.changeRecord, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('User: ${changeRecord.user}'),
        Text('Timestamp: ${changeRecord.timestamp.toString()}'),
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*2*/
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ] /*3*/
          ),
    );
  }
}
