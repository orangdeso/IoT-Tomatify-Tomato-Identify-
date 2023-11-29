// import 'package:flutter/material.dart';
// import 'package:tomato/view/detail_riwayat.dart';

// class HomeRiwayat extends StatefulWidget {
//   const HomeRiwayat({super.key});

//   @override
//   State<HomeRiwayat> createState() => _HomeRiwayatState();
// }

// class _HomeRiwayatState extends State<HomeRiwayat> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white, // Warna latar belakang container
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade300, // Warna bayangan
//             offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
//             blurRadius: 5.0, // Radius blur bayangan
//             spreadRadius: 2.0, // Radius penyebaran bayangan
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return DetailRiwayat();
//                 },
//               ),
//             );
//           },
//           splashColor: Colors.grey.shade300,
//           borderRadius: BorderRadius.circular(10),
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: ListTile(
//               leading: Text("Tanggal"),
//               title: Padding(
//                 padding: EdgeInsets.only(left: 12),
//                 child: Text(
//                   snapshot.child('title').value.toString(),
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: EdgeInsets.only(left: 12, top: 5),
//                 child: Text(
//                   "Melakukan Penyotiran",
//                   style: TextStyle(
//                       //fontSize: 16,
//                       ),
//                 ),
//               ),
//               trailing: Text("16.00"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
