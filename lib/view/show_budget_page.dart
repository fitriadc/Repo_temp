import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/budget.dart';
import '../widget/drawer.dart';

class ShowBudgetPage extends StatefulWidget {
  const ShowBudgetPage({super.key});

  @override
  State<ShowBudgetPage> createState() => _ShowBudgetPageState();
}

class _ShowBudgetPageState extends State<ShowBudgetPage> {
  @override
  Widget build(BuildContext context) {
    final dataBudget = DaftarBudget.daftarBudget;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: MyDrawer(),
        body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(children: [
              if (dataBudget == null)
                const Center(
                  child: Text("Data Kosong"),
                )
              else if (dataBudget.isEmpty)
                const Center(
                  child: Text("Data Kosong"),
                )
              else
                Expanded(
                    child: ListView.builder(
                        itemCount: dataBudget.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            title: Text(dataBudget[index].getName),
                            subtitle: Text(dataBudget[index].getAmount +
                                " || " +
                                dataBudget[index].getDate),
                            trailing: Text(dataBudget[index].getType),
                          ));
                        }))
            ])));
  }
}
