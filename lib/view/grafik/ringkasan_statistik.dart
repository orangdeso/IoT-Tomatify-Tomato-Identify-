import 'package:flutter/material.dart';
import 'package:tomato/view/grafik/custom_text_tomat.dart';

class RingkasanStatistik extends StatefulWidget {
  const RingkasanStatistik({super.key});

  @override
  State<RingkasanStatistik> createState() => _RingkasanStatistikState();
}

class _RingkasanStatistikState extends State<RingkasanStatistik> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Ringkasan statistik",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                letterSpacing: 0.5,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              tooltip: 'Lihat',
              icon: Icon(
                Icons.error_outline_rounded,
                color: Colors.grey.shade600,
              ),
            )
          ],
        ),
        Text(
          "Terus pantau perkembangan penyotiran tomat anda untuk meningkatkan kualitas",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

Future _showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        //height: 700,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ringkasan statistik",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade800,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextTomat(
                    title: "Tomat kecil",
                    description:
                        "Akumulasi penjumlahan tomat kecil berdasarkan pengklasifikasian hari ini",
                  ),
                  CustomTextTomat(
                    title: "Tomat Besar",
                    description:
                        "Akumulasi penjumlahan tomat besar berdasarkan pengklasifikasian hari ini",
                  ),
                  CustomTextTomat(
                    title: "Tomat Matang",
                    description:
                        "Akumulasi penjumlahan tomat matang berdasarkan pengklasifikasian hari ini",
                  ),
                  CustomTextTomat(
                    title: "Tomat Besar",
                    description:
                        "Akumulasi penjumlahan tomat mentah berdasarkan pengklasifikasian hari ini",
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
