import 'package:counter_7/model/budget.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

class AddBudgetFormPage extends StatefulWidget {
  const AddBudgetFormPage({super.key});

  @override
  State<AddBudgetFormPage> createState() => _AddBudgetFormPageState();
}

class _AddBudgetFormPageState extends State<AddBudgetFormPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _date;
  final _nameController = TextEditingController();
  final _nominalController = TextEditingController();
  final _typeController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: MyDrawer(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // input Nama
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul ",
                      icon: Icon(Icons.title),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Nominal
                  TextFormField(
                    controller: _nominalController,
                    decoration: const InputDecoration(
                      labelText: 'Nominal',
                      hintText: "Contoh: 50000",
                      icon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        return 'Nominal harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // type
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'type',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Pemasukan',
                        child: Text('Pemasukan'),
                      ),
                      DropdownMenuItem(
                        value: 'Pengeluaran',
                        child: Text('Pengeluaran'),
                      ),
                    ],
                    onChanged: (value) => setState(() {
                      _typeController.text = value!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Type tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Tanggal
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      chooseDate(context: context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal tidak boleh kosong!';
                      } else if (DateTime.tryParse(value) == null) {
                        return 'Tanggal tidak valid!';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addBudget(_nameController.text, _nominalController.text,
                      _typeController.text, _dateController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data berhasil disimpan'),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              child: const Text('Reset'),
              onPressed: () {
                _nameController.clear();
                _nominalController.clear();
                _typeController.clear();
                _dateController.clear();
              },
            ),
          ],
        ),
      ],
    );
  }

  // Fungsi untuk data picker
  Future<Function()?> chooseDate({required BuildContext context}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2015),
    );
    if (date != null) {
      _dateController.text = date.toString();
    }
    return null;
  }
}

void addBudget(String name, String nominal, String type, String date) {
  DaftarBudget.daftarBudget
      .add(Budget(name: name, amount: nominal, type: type, date: date));
}
