import 'package:flutter/material.dart';
import 'package:tomato/view/riwayat/list_tab.dart';
import 'package:tomato/view/RiwayatBerat.dart';
import 'package:tomato/view/RiwayatCitra.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  List<Tab> myTab = ListTab.getTabs();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Riwayat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.5,
                  color: Colors.grey.shade800,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Color.fromARGB(255, 98, 150, 130),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade400,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 98, 150, 130),
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                //labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: myTab,
              ),
            ),
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.all(10),
              child: TabBarView(
                children: [
                  RiwayatBerat(),
                  RiwayatCitra(),
                ],
              ),
            )),
      ),
    );
  }
}
