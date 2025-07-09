import 'package:flutter/material.dart';

class ListTab {
  static List<Tab> getTabs() {
    return [
      Tab(
        child: Text(
          "Penyotiran Berat",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            letterSpacing: 0.5,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      Tab(
        child: Text(
          "Penyotiran Kematangan",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            letterSpacing: 0.5,
            color: Colors.grey.shade800,
          ),
        ),
      )
      // Tambahkan tab lainnya di sini
    ];
  }
}
