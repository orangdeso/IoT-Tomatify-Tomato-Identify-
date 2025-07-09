import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tomato/helpers/ApiHelper.dart';

class AkumulasiCitra {
  int? kode;
  String? message;
  List<Data>? data;

  AkumulasiCitra({this.kode, this.message, this.data});

  AkumulasiCitra.fromJson(Map<String, dynamic> json) {
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

  static Future<AkumulasiCitra> tampilMatang() async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'akumulasi_matang.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      print(body);
      return AkumulasiCitra.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }

  static Future<AkumulasiCitra> tampilMentah() async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'akumulasi_mentah.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      print(body);
      return AkumulasiCitra.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }
}

class Data {
  String? createdAt;
  String? jumlahMatang;

  Data({this.createdAt, this.jumlahMatang});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    jumlahMatang = json['JumlahMatang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['JumlahMatang'] = this.jumlahMatang;
    return data;
  }
}
