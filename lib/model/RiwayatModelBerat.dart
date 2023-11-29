import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tomato/helpers/ApiHelper.dart';

RiwayatModelBerat pengumumanModelFromJson(String str) =>
    RiwayatModelBerat.fromJson(json.decode(str));

class RiwayatModelBerat {
  int? kode;
  String? message;
  List<Data>? data;

  RiwayatModelBerat({
    this.kode,
    this.message,
    this.data,
  });

  RiwayatModelBerat.fromJson(Map<String, dynamic> json) {
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

  static Future<RiwayatModelBerat> getRiwayatBerat(BuildContext context) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'get_riwayat_berat.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      print("data tersedia");
      return RiwayatModelBerat.fromJson(body);
    } catch (e) {
      //_alertGagal(context);
      throw Exception('$e');
    }
  }

  static Future<RiwayatModelBerat> getDetailBerat(String? tanggal) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'detail_riwayat_berat.php');
      var response = await http.post(url, body: {
        'tanggal': tanggal,
      });
      var body = json.decode(response.body);
      print("data tersedia");
      return RiwayatModelBerat.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }
}

class Data {
  String? id;
  String? berat;
  String? tanggal;
  String? waktu;
  String? totalBerat;
  String? kecil;
  String? besar;

  Data({
    this.id,
    this.berat,
    this.tanggal,
    this.waktu,
    this.totalBerat,
    this.kecil,
    this.besar,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id_berat'];
    berat = json['berat'];
    tanggal = json['tanggal'];
    waktu = json['waktu'];
    totalBerat = json['total_berat'];
    kecil = json['kecil'];
    besar = json['besar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_berat'] = this.id;
    data['berat'] = this.berat;
    data['tanggal'] = this.tanggal;
    data['waktu'] = this.waktu;
    data['total_berat'] = this.totalBerat;
    data['kecil'] = this.kecil;
    data['besar'] = this.besar;
    return data;
  }
}
