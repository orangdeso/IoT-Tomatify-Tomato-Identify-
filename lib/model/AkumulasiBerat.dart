import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tomato/helpers/ApiHelper.dart';

class AkumulasiBerat {
  int? kode;
  String? message;
  List<Data>? data;

  AkumulasiBerat({this.kode, this.message, this.data});

  AkumulasiBerat.fromJson(Map<String, dynamic> json) {
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

  static Future<AkumulasiBerat> tampilKecil() async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'akumulasi_kecil.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      return AkumulasiBerat.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }

  static Future<AkumulasiBerat> tampilBesar() async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'akumulasi_berat.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      return AkumulasiBerat.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }
}

class Data {
  String? createdAt;
  String? BeratTomat;

  Data({this.createdAt, this.BeratTomat});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    BeratTomat = json['BeratTomat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['BeratTomat'] = this.BeratTomat;
    return data;
  }
}
