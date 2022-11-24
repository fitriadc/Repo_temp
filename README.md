Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023
App Name : Counter 7

# Task 7: Basic Element in Flutter

## Stateless Widget and Stateful Widget

- Stateless widget adalah widget yang bersifat statis dimana tidak terjadi perubahan data. Stateless widget hanya memiliki satu state saja, yaitu state awal.
- Stateful widget adalah widget yang bersifat dinamis dimana dapat terjadi perubahan yang menyesuaikan dengan state yang berlaku. Stateful widget memiliki dua state, yaitu state awal dan state yang terjadi secara dinamis.

## Widget in Counter 7 Programme

1. MaterialApp, widget untuk membuat aplikasi yang memiliki material design.
2. ThemeData, widget untuk mengatur tema aplikasi.
3. Scaffold, widget untuk membuat layout widget.
4. AppBar, widget untuk membuat bar atas.
5. Column, widget untuk menampilkan widget secara vertikal.
6. Row, widget untuk menampilkan widget secara horizontal.
7. Container, widget untuk menampung widget lainnya.
8. FloatingActionButton, widget untuk membuat tombol.
9. Icon, widget untuk menampilkan icon.
10. Sizedbox, widget untuk menampilkan box dengan ukuran spesifik.
11. StatefulWidget, widget yang bisa berubah-ubah statenya.
12. Statelesswidget, widget yang tidak bisa berubah state.
13. Text, widget untuk menciptakan teks.

## SetState()

SetState adalah sebuah method dari statefulwidget yang berfungsi untuk memberitahu adanya perubahan internal state. Ketika setState dipanggil maka akan terjadi pembaharuan widget yang dilakukan dengan cara memanggil method build() untuk me-rebuild widget-widget kondisi sebelumnya. Variabel yang akan berdampak adalah variabel yang berada di dalam fungsi set state

## Difference Between Const vs Final

- const adalah variabel immutable yang bersifat konstan dan nilainya harus diketahui saat compile time. Namun setiap kali render bisa dideklarasikan ulang.
- final adalah variabel immutable yang tidak dapat diubah setelah dideklarasikan dan perlu langsung diinisiasi. Nilai dari variabel ini diketahui ketika run timee.

## Programme Implementation

1. Membuat aplikasi Flutter bernama counter_7 dengan perintah `flutter create counter_7`
2. Membuat counter_7 dengan homepage counter_7_page yang dibuat dari statefulwidget
3. Membuat tampilan program sesuai dengan ketentuan soal
4. Membuat fungsi untuk menambah dan mengurangi counter

```
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
```

5. Membuat widget untuk menampilkan kata ganjil atau genap

```
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
```

4. Membuat widget untuk menampilkan button tambah dan kurang (bonus : button kurang menghilang jika counter bernilai 0)

```
 children: [
            _counter > 0 ? FloatingActionButton(onPressed: _decrementCounter,
                tooltip: "Decrement",
                child: const Icon(Icons.remove)) : SizedBox(),
            FloatingActionButton(onPressed: _incrementCounter,
                tooltip: "Increment",
                child: const Icon(Icons.add))
          ],
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Task 8: Basic Element in Flutter

## Perbedaan Navigator.push dan Navigator.pushReplacement.

`Navigator.push` berfungsi untuk menambahkan route baru ke stack navigasi dimana layer akan ditimpa seperti halnya tipe data stack. Sementara itu, `Navigator.pushReplacement` berfungsi untuk mengganti route yang ada di stack navigasi dengan route baru sehingga layer tidak akan ditimpa melainkan hanya diganti menjadi layer yang diinginkan.

## Widget yang digunakan dan Fungsinya

- Container: menampung widget lainnya
- Form: membuat form
- Column: menampung widget lainnya secara vertikal
- ListTile: menampung teks sebagai leading dan trailing
- Drawer: navigasi di sisi kiri layar untuk perpindahan tampilan
- TextFormField : ask input text
- DropDownButton : membuat fields untuk memilih input
- DatePicker : memilih tanggal
- TextButton : membuat tombol berbasis text untuk trigger datepicker

## Jenis-jenis event yang ada pada Flutter

- OnPressed
- OnChange
- OnSaved
- OnTap
- OnComplete

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Seperti tipe data stack, navigator menyediakan dua cara untuk mengatur route, yaitu secara declarative menggunakan `Navigator.pages` dan imperative menggunakan `Navigator.push`, `Navigator.pushReplacement`, dan `Navigator.pop`. Navigator akan menampilkan halaman teratas untuk dimunculkan. Ketika navitagor push, layer sebelumnya akan ditimpa dan tetap tersimpan di bawah layer yang baru, sementara pushreplacement akan mengganti layernya.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat file drawer yang berisi route untuk masing masing class counter, showBudget, dan addBudget.
2. Membuat file budget_form_page.dart untuk membuat form untuk dimasukkan kedalam List di daftarBudget.
3. File showBudget akan diset untuk memiliki fungsi untuk menambahkan obj paada atribut classnya untuk menampung data yang diinput.
4. Membuat showBudget dan melakukan loop dari daftarBudget.len untuk diloop dan ditampilkan.

# Task 9: Integrasi Web Service pada Flutter

## Pengambilan data JSON tanpa membuat model terlebih dahulu

Pengambilan data JSON tetap dapat dilakukan meskipun tanpa membuat model. Hal ini dilakukan dengan cara data akan dikirim dalam bentuk HTTP response berupa raw data. Namun terdapat kelemahan yaitu developer akan kesulitan dalam melihat data asli. Oleh sebab itu lebih baik menggunakan models karena models akan membantu developer dalam melihat data sehingga akan memudahkan juga update data yang telah dirubah menjadi object dart.

## Widget yang digunakan beserta fungsinya.

- Column untuk menyusun widget secara vertikal
- FutureBuilder untuk fetching data sehingga tercipta widget yang sesuai dengan hasil fetch data
- Drawer untuk navigasi halaman
- ListView untuk mengelompokan beberapa item data dan membuat halaman dapat discroll

## Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

Pada tahap persiapan, dilakukan terlebih dahulu pembuatan spesifikasi model yang akan digunakan sebagai data. Kemudian dibuat fungsi fetch data dengan memanfaatkan FetchBuilder. Data akan di fetch melalui request URL yang dituju dan akan mengemabalikan respon yang selanjutnya dirubah menjadi object dart. Tiap object tersebut kemudian akan dilooping dan disimpan dalam sebuah list. List diiterasi dan data akan ditampilkan.

## Cara kamu mengimplementasikan checklist di atas.

- Membuat page untuk menampilkan my watch list dan detail dari watch list tersebut kemudian menambahkan navigasi ke page tersebut pada drawer
- Membuat model my watchlist dan fungsi fetch untuk fetching data yang akan difetch melalui data JSON
- Mengimplementasikan kode untuk melakukan http request data JSON
- Mengisi my watch list page dengan iterasi data yang sudah di fetch
- Mengerjakan bonus
