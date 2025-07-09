import 'package:flutter/material.dart';

class CardBerat extends StatefulWidget {
  const CardBerat({super.key});

  @override
  State<CardBerat> createState() => _CardBeratState();
}

class _CardBeratState extends State<CardBerat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                //width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300, // Warna bayangan
                      offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
                      blurRadius: 4, // Radius blur bayangan
                      spreadRadius: 2, // Radius penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tomat besar",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "dari kemarin (00:00 - 00:00)",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                //width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300, // Warna bayangan
                      offset: Offset(0.0, 2.0), // Posisi bayangan (X, Y)
                      blurRadius: 4, // Radius blur bayangan
                      spreadRadius: 2, // Radius penyebaran bayangan
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tomat kecil",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "dari kemarin (00:00 - 00:00)",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
