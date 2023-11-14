import 'package:flutter/material.dart';

class DetailRiwayat extends StatefulWidget {
  const DetailRiwayat({super.key});

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Riwayat",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Colors.grey.shade800,
            letterSpacing: 1,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade800,
        ),
        elevation: 3.5,
        shadowColor: Colors.grey.shade100,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white, // Warna latar belakang container
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300, // Warna bayangan
                          offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
                          blurRadius: 5.0, // Radius blur bayangan
                          spreadRadius: 2.0, // Radius penyebaran bayangan
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ketegori Tomat",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
