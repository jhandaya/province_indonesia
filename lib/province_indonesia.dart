import 'dart:async';
import 'package:recase/recase.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:province_indonesia/data_model.dart';

class ProvinceIndonesia {
  // static const MethodChannel _channel =
  //     const MethodChannel('province_indonesia');

  // static Future<String?> get platformVersion async {
  //   final String? version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  static Future<dynamic> _readJson(String filePath) async {
    final String response;

    try {
      
      //PATH TO PACKAGE **Must provide full path  

      filePath = "packages/province_indonesia/assets/json/" + filePath;
      response = await rootBundle.loadString(filePath);
      final data = await json.decode(response);

      return data;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<DataModel>> getProvince() async {
    List<DataModel> _list = [];

    String filePath = 'province.json';
    var result = await _readJson(filePath);

    (result as List).map((e) async {
      DataModel value = new DataModel(
          id: e['id'], name: (e['nama']).toString().titleCase, parentId: 'ID');

      _list.add(value);
    }).toList();

    return _list;
  }

  static Future<List<DataModel>> getKabupaten(
      {required String provinceId}) async {
    List<DataModel> _list = [];

    String filePath = 'kabupaten/$provinceId.json';

    var result = await _readJson(filePath);

    (result as List).map((e) async {
      DataModel value = new DataModel(
          id: e['id'],
          name: (e['nama']).toString().titleCase,
          parentId: provinceId);

      _list.add(value);
    }).toList();

    return _list;
  }

  static Future<List<DataModel>> getKecamatan(
      {required String kabupatenId}) async {
    List<DataModel> _list = [];
    var result = await _readJson('kecamatan/$kabupatenId.json');
    (result as List).map((e) async {
      DataModel value = new DataModel(
          id: e['id'],
          name: (e['nama']).toString().titleCase,
          parentId: kabupatenId);
      _list.add(value);
    }).toList();

    return _list;
  }

  static Future<List<DataModel>> getKelurahan(
      {required String kecamatanId}) async {
    List<DataModel> _list = [];

    var result = await _readJson('kelurahan/$kecamatanId.json');

    (result as List).map((e) async {
      DataModel value = new DataModel(
          id: e['id'],
          name: (e['nama']).toString().titleCase,
          parentId: kecamatanId);
      _list.add(value);
    }).toList();
    return _list;
  }
}
