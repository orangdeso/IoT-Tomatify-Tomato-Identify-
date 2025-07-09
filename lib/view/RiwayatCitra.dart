import 'package:flutter/material.dart';
import 'package:tomato/model/RiwayatModelCitra.dart';
import 'package:tomato/view/detail_riwayat_citra.dart';

class RiwayatCitra extends StatefulWidget {
  const RiwayatCitra({
    super.key,
  });

  @override
  State<RiwayatCitra> createState() => _RiwayatCitraState();
}

class _RiwayatCitraState extends State<RiwayatCitra> {
  List<Data> _dataCitra = [];

  void fetchData() async {
    RiwayatModelCitra.getRiwayatCitra(context).then((value) {
      setState(() {
        _dataCitra = value.data!;
      });
    });
  }

  @override
  void initState() {
    fetchData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _dataCitra.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang container
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200, // Warna bayangan
                  offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
                  blurRadius: 5.0, // Radius blur bayangan
                  spreadRadius: 2.0, // Radius penyebaran bayangan
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
                        return DetailRiwayatCitra(
                          tanggal: _dataCitra[index].tanggal.toString(),
                        );
                      },
                    ),
                  );
                },
                splashColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Text(
                      "${_dataCitra[index].tanggal}",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade700,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Melakukan penyotiran",
                        // snapshot
                        //     .child('title')
                        //     .value
                        //     .toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        "Jumlah tomat : ${_dataCitra[index].jumlahTomat}",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    trailing: Text("${_dataCitra[index].waktu}"),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
