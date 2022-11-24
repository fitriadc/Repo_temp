import 'package:counter_7/view/show_budget_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/drawer.dart';
import 'budget_form_page.dart';

class MyCounterPage extends StatefulWidget {
  const MyCounterPage({super.key, required this.title});
  final String title;

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Counter'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(_counter.isOdd)
              const Text('GANJIL', style: TextStyle(color: Colors.red),),
            if (_counter.isEven)
              const Text('GENAP', style: TextStyle(color: Colors.blue)),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 40, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _counter > 0 ? FloatingActionButton(onPressed: _decrementCounter,
                tooltip: "Decrement",
                child: const Icon(Icons.remove)) : SizedBox(),
            FloatingActionButton(onPressed: _incrementCounter,
                tooltip: "Increment",
                child: const Icon(Icons.add))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}