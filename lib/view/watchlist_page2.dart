// import '../widget/drawer.dart';
// import '../function/fetch_watchlist.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class WatchListPage extends StatefulWidget {
//   const WatchListPage({Key? key}) : super(key: key);

//   @override
//   State<WatchListPage> createState() => _WatchListState();
// }

// class _WatchListState extends State<WatchListPage> {
//   @override
//   Widget build(BuildContext context) {
//     Scaffold(
//         appBar: AppBar(
//           title: const Text('My Watch List'),
//         ),
//         drawer: Drawer(),
//         body: FutureBuilder(
//             future: fetchMyWatchList(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 if (!snapshot.hasData) {
//                   return Column(
//                     children: const [
//                       Text(
//                         "Tidak ada watchlist :(",
//                         style:
//                             TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                       ),
//                       SizedBox(height: 8),
//                     ],
//                   );
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (_, index) => Container(
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 12),
//                             padding: const EdgeInsets.all(20.0),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                       color: Colors.black, blurRadius: 2.0)
//                                 ]),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ListTile(
//                                   title:
//                                 Text(
//                                   "${snapshot.data![index].fields.title}",
//                                   style: const TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 trailing: Column(
//                                   children : [
//                                     Checkbox (
//                                       checkColor: Colors.white,
//                                       fillColor:
//                                       MaterialStatePorperty.resolWith<Color>((Set<MaterialState> states){
//                                         if (snapshot.data![index].fields.watched){
//                                           return Colors.green;
//                                         } return Colors.red;
//                                       }),
//                                       value : snapshot.data![index].fields.watched,
//                                       onChanged: (bool? value){
//                                         setState((){
//                                           snapshot.data![index].fields.watched =value!;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 )
//                                 onTap:(){
//                                   Navigator.push(
//                                     context;
//                                     MaterialPageRoute(builder:(context => ShowDetailWatchListPage(
//                                       watchlistItem: snapshot.data![index]
//                                     )))
//                                   )
//                                 }
                                
//                               ],
//                             ),)
//                           ));
//                 }
//               }
//             }));
//   }
// }
