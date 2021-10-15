import 'package:flutter/material.dart';

import 'filter_dialog.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogFilter,
        tooltip: 'Increment',
        backgroundColor: const Color(0xFFD83F26),
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialogFilter() {
    showDialog(
        context: context,
        //barrierDismissible: false,
        builder: (_) {
          return StatefulBuilder(builder: (_, __) {
            return FilterDialog();
          });
        });
  }
}
