import 'package:counter_7/view/counter_7_page.dart';
import 'package:flutter/material.dart';

import '../view/budget_form_page.dart';
import '../view/watchlist_page.dart';
import '../view/show_budget_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyCounterPage(title: 'Counter_7')));
            },
          ),
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddBudgetFormPage()));
            },
          ),
          ListTile(
            title: const Text("Data Budget"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShowBudgetPage()));
            },
          ),
          ListTile(
            title: const Text("My Watch List"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WatchListPage()));
            },
          ),
        ],
      ),
    );
  }
}