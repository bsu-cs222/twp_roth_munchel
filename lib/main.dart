import 'package:flutter/material.dart';
import 'package:twp_roth_munchel/uri_builder.dart';
import 'package:twp_roth_munchel/revison_parser.dart';

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
  final _finalUrl = UriBuilder();
  final _revision = RevisionParser();
  Future? _future;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _future == null
              ? const Text('Press the button!')
              : FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return const Text('Timer is done!');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
          ElevatedButton(
            onPressed: _onButtonPressed,
            child: const Text('Go'),
          ),
          TextField(controller: _textController),
        ],
      ),
    );
  }

  void _onButtonPressed() {
    setState(() {
      _future = Future.delayed(
        const Duration(seconds: 3),
      );
    });
  }
}
