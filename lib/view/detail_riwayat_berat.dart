import 'package:flutter/material.dart';
import 'package:tomato/model/RiwayatModelBerat.dart';

class DetailRiwayatBerat extends StatefulWidget {
  final String tanggal;

  DetailRiwayatBerat({
    Key? key,
    required this.tanggal,
  }) : super(key: key);

  @override
  State<DetailRiwayatBerat> createState() => _DetailRiwayatBeratState();
}

class _DetailRiwayatBeratState extends State<DetailRiwayatBerat> {
  late String valueTanggal;
  List<Data> listData = [];

  void tampilDetail() async {
    RiwayatModelBerat.getDetailBerat(valueTanggal).then((value) {
      listData = value.data ?? [];
      setState(() {});
    });
  }

  @override
  void initState() {
    valueTanggal = widget.tanggal;
    print(valueTanggal);
    tampilDetail();
    super.initState();
  }

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
        elevation: 2.5,
        shadowColor: Colors.grey.shade100,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listData.length,
            itemBuilder: (context, index) {
              int berat = int.parse(
                  listData[index].totalBerat ?? '0'); // Konversi ke integer
              bool isBeratLebihDari200 = berat >= 200;
              bool isBeratKurangDari200 = berat < 200;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 6,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 98, 150, 130),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Selesai penyotiran",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 98, 150, 130),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(right: 10),
                      //   padding: EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(255, 222, 247, 236),
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(
                      //       color: Color.fromARGB(255, 98, 150, 130),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.access_time_rounded,
                      //         color: Color.fromARGB(255, 98, 150, 130),
                      //         size: 20,
                      //       ),
                      //       SizedBox(
                      //         width: 6,
                      //       ),
                      //       Text(
                      //         "${listData[index].waktu}",
                      //         style: TextStyle(
                      //           fontFamily: 'Poppins',
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w600,
                      //           color: Color.fromARGB(255, 98, 150, 130),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    thickness: 10,
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Informasi Penyotiran",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ID Tomat",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              "${listData[index].id}",
                              //textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tanggal Penyotiran",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              "${listData[index].tanggal}",
                              //textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Waktu Penyotiran",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              "${listData[index].waktu} WIB",
                              //textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Kategori Berat Tomat",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tomat Kecil",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              isBeratKurangDari200
                                  ? "${listData[index].kecil} / gram" // Tampilkan berat jika kurang dari 200
                                  : "0", // Tampilkan 0 jika lebih dari atau sama dengan 200
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tomat Besar",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              isBeratLebihDari200
                                  ? "0"
                                  : "${listData[index].besar} / gram",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
