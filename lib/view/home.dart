import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tomato/view/detail_riwayat.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String greeting = '';

  void setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      setState(() {
        greeting = 'Selamat Pagi, ';
      });
    } else if (hour < 18) {
      setState(() {
        greeting = 'Selamat Siang,';
      });
    } else {
      setState(() {
        greeting = 'Selamat Malam,';
      });
    }
  }

  String tanggalOtomatis = DateFormat('dd MMMM yyyy').format(DateTime.now());
  String tanggalOtomatis2 = DateFormat('dd MMM yyyy').format(DateTime.now());

  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realTimeValue = '0';

  @override
  void initState() {
    setGreeting();
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('coba');

    // Listen to firebase realtime database value
    _testRef.onValue.listen(
      (event) {
        if (event.snapshot.exists) {
          print(event.snapshot.value);
          setState(() {
            realTimeValue = event.snapshot.value.toString();
          });
        } else {
          print("no data");
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: _fApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something wrong with firebase");
              } else if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          " Selamat Datang di Tomatify",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color:
                                            Color.fromARGB(255, 98, 150, 130),
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
                                          color:
                                              Color.fromARGB(255, 98, 150, 130),
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
                              Expanded(
                                child: Container(
                                  width: 100,
                                  height: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .grey.shade500, // Warna bayangan
                                        offset: Offset(
                                            0.0, 2.0), // Posisi bayangan (X, Y)
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
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${realTimeValue}",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Kecil Matang",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  height: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .grey.shade500, // Warna bayangan
                                        offset: Offset(
                                            0.0, 2.0), // Posisi bayangan (X, Y)
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
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "6",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Kecil kurang matang",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100,
                                  height: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .grey.shade500, // Warna bayangan
                                        offset: Offset(
                                            0.0, 2.0), // Posisi bayangan (X, Y)
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
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "6",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Besar Matang",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  height: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors
                                            .grey.shade500, // Warna bayangan
                                        offset: Offset(
                                            0.0, 2.0), // Posisi bayangan (X, Y)
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
                                    color: Color.fromARGB(255, 98, 150, 130),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "6",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Besar kurang matang",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Riwayat Penyotiran",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Warna latar belakang container
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors
                                          .grey.shade300, // Warna bayangan
                                      offset: Offset(
                                          0.0, 2.0), // Posisi bayangan (X, Y)
                                      blurRadius: 5.0, // Radius blur bayangan
                                      spreadRadius:
                                          2.0, // Radius penyebaran bayangan
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DetailRiwayat();
                                          },
                                        ),
                                      );
                                    },
                                    splashColor: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: ListTile(
                                        leading: Text("${tanggalOtomatis2}"),
                                        title: Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Melakukan Penyotiran",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              EdgeInsets.only(left: 12, top: 5),
                                          child: Text(
                                            "Melakukan Penyotiran",
                                            style: TextStyle(
                                                //fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        trailing: Text("16.00"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
