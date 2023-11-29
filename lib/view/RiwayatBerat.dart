import 'package:flutter/material.dart';
import 'package:tomato/model/RiwayatModelBerat.dart';
import 'package:tomato/view/detail_riwayat.dart';

class RiwayatBerat extends StatefulWidget {
  const RiwayatBerat({
    super.key,
  });

  @override
  State<RiwayatBerat> createState() => _RiwayatBeratState();
}

class _RiwayatBeratState extends State<RiwayatBerat> {
  List<Data> _dataBerat1 = [];

  void fetchData() async {
    RiwayatModelBerat.getRiwayatBerat(context).then((value) {
      setState(() {
        _dataBerat1 = value.data!;
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
      itemCount: _dataBerat1.length,
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
                  offset: Offset(0.0, 10.0), // Posisi bayangan (X, Y)
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
                        return DetailRiwayat(
                          tanggal: _dataBerat1[index].tanggal.toString(),
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
                    leading: Text("${_dataBerat1[index].tanggal}"),
                    title: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Melakukan penyotiran",
                        // snapshot
                        //     .child('title')
                        //     .value
                        //     .toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(left: 12, top: 5),
                      child: Text(
                        "Klik untuk detail",
                        style: TextStyle(
                            //fontSize: 16,
                            ),
                      ),
                    ),
                    trailing: Text("${_dataBerat1[index].waktu}"),
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
