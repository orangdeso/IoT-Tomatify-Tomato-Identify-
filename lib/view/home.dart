import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tomato/model/AkumulasiBerat.dart';
import 'package:tomato/model/AkumulasiCitra.dart';
import 'package:tomato/view/RiwayatBerat.dart';
// import 'package:tomato/view/detail_riwayat.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:tomato/helpers/ApiHelper.dart';
// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Firebase
  // final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  // String realTimeValue = '0';

  String tanggalOtomatis = DateFormat('dd MMMM yyyy').format(DateTime.now());
  String tanggalOtomatis2 = DateFormat('dd MMM yyyy').format(DateTime.now());

  // Http
  // List<Data> ListBerat = [];
  // List<Data> ListKecil = [];

  // void tampilBerat() async {
  //   AkumulasiBerat.tampilBesar().then((value) {
  //     setState(() {
  //       ListBerat = value.data!;
  //     });
  //   });
  //   AkumulasiBerat.tampilKecil().then((value) {
  //     setState(() {
  //       ListKecil = value.data!;
  //     });
  //   });
  // }

  @override
  void initState() {
    //setGreeting();
    // Firebase.initializeApp();
    // tampilBerat();
    AkumulasiBerat.tampilBesar();
    AkumulasiBerat.tampilKecil();
    AkumulasiCitra.tampilMatang();
    AkumulasiCitra.tampilMentah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Firebase
    // DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('coba');
    // final _riwayat = FirebaseDatabase.instance.ref().child('tomato');

    // // Listen to firebase realtime database value
    // _testRef.onValue.listen(
    //   (event) {
    //     if (event.snapshot.exists) {
    //       print(event.snapshot.value);
    //       setState(() {
    //         realTimeValue = event.snapshot.value.toString();
    //       });
    //     } else {
    //       print("no data");
    //     }
    //   },
    // );

    // Mengkonversi nilai lebih dari 6
    // String displayValue = realTimeValue;

    // if (realTimeValue.length > 6) {
    //   displayValue = realTimeValue.substring(0, 6) + "...";
    // }

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna latar belakang container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300, // Warna bayangan
                        offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
                        blurRadius: 5.0, // Radius blur bayangan
                        spreadRadius: 2.0, // Radius penyebaran bayangan
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      "Selamat Datang di Tomatify",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(255, 98, 150, 130),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Color.fromARGB(255, 98, 150, 130),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${tanggalOtomatis}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 98, 150, 130),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          FutureBuilder(
                            future: AkumulasiBerat.tampilKecil(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                String besarTomat =
                                    snapshot.data!.data![0].BeratTomat ?? '0';
                                return Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 136,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .grey.shade300, // Warna bayangan
                                          offset: Offset(0.0,
                                              2.0), // Posisi bayangan (X, Y)
                                          blurRadius: 8, // Radius blur bayangan
                                          spreadRadius:
                                              2, // Radius penyebaran bayangan
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // elevation: 10,
                                      // shadowColor: Colors.grey.shade300,
                                      color: Color.fromARGB(255, 98, 150, 130),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${besarTomat}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  " / gram",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Tomat Kecil",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          FutureBuilder(
                            future: AkumulasiBerat.tampilBesar(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                String besarTomat =
                                    snapshot.data!.data![0].BeratTomat ?? '0';
                                return Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 136,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .grey.shade300, // Warna bayangan
                                          offset: Offset(0.0,
                                              2.0), // Posisi bayangan (X, Y)
                                          blurRadius: 8, // Radius blur bayangan
                                          spreadRadius:
                                              2, // Radius penyebaran bayangan
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // elevation: 10,
                                      // shadowColor: Colors.grey.shade300,
                                      color: Color.fromARGB(255, 98, 150, 130),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${besarTomat}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  " / gram",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Tomat Berat",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          FutureBuilder(
                            future: AkumulasiCitra.tampilMatang(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                String jumlahTomat =
                                    snapshot.data!.data![0].jumlahMatang ?? '0';
                                return Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 136,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .grey.shade300, // Warna bayangan
                                          offset: Offset(0.0,
                                              2.0), // Posisi bayangan (X, Y)
                                          blurRadius: 8, // Radius blur bayangan
                                          spreadRadius:
                                              2, // Radius penyebaran bayangan
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // elevation: 10,
                                      // shadowColor: Colors.grey.shade300,
                                      color: Color.fromARGB(255, 98, 150, 130),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${jumlahTomat}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  " / pcs",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Tomat Matang",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          FutureBuilder(
                            future: AkumulasiCitra.tampilMentah(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                String jumlahTomat =
                                    snapshot.data!.data![0].jumlahMatang ?? '0';
                                return Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 136,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .grey.shade300, // Warna bayangan
                                          offset: Offset(0.0,
                                              2.0), // Posisi bayangan (X, Y)
                                          blurRadius: 8, // Radius blur bayangan
                                          spreadRadius:
                                              2, // Radius penyebaran bayangan
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // elevation: 10,
                                      // shadowColor: Colors.grey.shade300,
                                      color: Color.fromARGB(255, 98, 150, 130),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${jumlahTomat}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  " / pcs",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Tomat Mentah",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Align(
                        alignment: FractionalOffset.topLeft,
                        child: Text(
                          "Riwayat Penyotiran Berat",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RiwayatBerat(),
                      SizedBox(
                        height: 26,
                      ),
                      Align(
                        alignment: FractionalOffset.topLeft,
                        child: Text(
                          "Riwayat Penyotiran Warna",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget listItem() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white, // Warna latar belakang container
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.shade300, // Warna bayangan
  //           offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
  //           blurRadius: 5.0, // Radius blur bayangan
  //           spreadRadius: 2.0, // Radius penyebaran bayangan
  //         ),
  //       ],
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return DetailRiwayat();
  //               },
  //             ),
  //           );
  //         },
  //         splashColor: Colors.grey.shade300,
  //         borderRadius: BorderRadius.circular(10),
  //         child: Padding(
  //           padding: EdgeInsets.all(10.0),
  //           child: ListTile(
  //             leading: Text("${tanggalOtomatis2}"),
  //             title: Padding(
  //               padding: EdgeInsets.only(left: 12),
  //               child: Text(
  //                 tomato['title'],
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //             subtitle: Padding(
  //               padding: EdgeInsets.only(left: 12, top: 5),
  //               child: Text(
  //                 "Melakukan Penyotiran",
  //                 style: TextStyle(
  //                     //fontSize: 16,
  //                     ),
  //               ),
  //             ),
  //             trailing: Text("16.00"),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
