import 'package:flutter/material.dart';
import 'package:tomato/view/grafik/card_berat.dart';
import 'package:tomato/view/grafik/card_kematangan.dart';
import 'package:tomato/view/grafik/ringkasan_statistik.dart';

class GrafikPage extends StatefulWidget {
  const GrafikPage({super.key});

  @override
  State<GrafikPage> createState() => _GrafikPageState();
}

class _GrafikPageState extends State<GrafikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistik Penyotiran",
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
        automaticallyImplyLeading: false,
        elevation: 2.5,
        shadowColor: Colors.grey.shade100,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RingkasanStatistik(),
                SizedBox(
                  height: 20,
                ),
                CardBerat(),
                SizedBox(
                  height: 16,
                ),
                CardKematangan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
