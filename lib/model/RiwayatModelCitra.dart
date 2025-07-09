import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tomato/helpers/ApiHelper.dart';

class RiwayatModelCitra {
  int? kode;
  String? message;
  List<Data>? data;

  RiwayatModelCitra({this.kode, this.message, this.data});

  RiwayatModelCitra.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<RiwayatModelCitra> getRiwayatCitra(BuildContext context) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'get_riwayat_citra.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      print("data tersedia");
      return RiwayatModelCitra.fromJson(body);
    } catch (e) {
      //_alertGagal(context);
      throw Exception('$e');
    }
  }

  static Future<RiwayatModelCitra> getDetailCitra(String? tanggal) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'detail_riwayat_citra.php');
      var response = await http.post(url, body: {
        'tanggal': tanggal,
      });
      var body = json.decode(response.body);
      print("data tersedia");
      return RiwayatModelCitra.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }
}

class Data {
  String? id_kematangan;
  String? tanggal;
  String? waktu;
  String? jumlahTomat;
  String? matang;
  String? mentah;

  Data({this.tanggal, this.waktu, this.jumlahTomat});

  Data.fromJson(Map<String, dynamic> json) {
    id_kematangan = json['id_kematangan'];
    tanggal = json['tanggal'];
    waktu = json['waktu'];
    jumlahTomat = json['JumlahTomat'];
    matang = json['matang'];
    mentah = json['mentah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kematangan'] = this.id_kematangan;
    data['tanggal'] = this.tanggal;
    data['waktu'] = this.waktu;
    data['JumlahTomat'] = this.jumlahTomat;
    data['matang'] = this.matang;
    data['mentah'] = this.mentah;
    return data;
  }
}
