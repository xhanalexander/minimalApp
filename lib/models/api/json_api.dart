import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minimalapp/constant/constant.dart';
import 'package:minimalapp/models/api_models.dart';

class JsonApi {

  Future<List<DataModels>> getDataList({required int page, required int limit}) async {
    try {
      final response = await http.get(Uri.parse('${Constant.baseUrl}posts?_page=$page&_limit=$limit'));
      final List<dynamic> maps = json.decode(response.body);
      return maps.map((e) => DataModels.fromJson(e)).toList();
    } catch (e) {
      debugPrint('> Error API: $e');
      return [];
    }
  }

  Future<DataModels> getIds({required int ids}) async {
    try {
      final response = await http.get(Uri.parse('${Constant.baseUrl}posts/$ids'));
      final Map<String, dynamic> map = json.decode(response.body);
      debugPrint('> Data: $map');
      return DataModels.fromJson(map);
    } catch (e) {
      debugPrint('Error: $e');
      return DataModels();
    }
  }

  Future<List<DataModels>> searchData({required String query}) async {
    try {
      final response = await http.get(Uri.parse('${Constant.baseUrl}posts?q=$query'));
      final List<dynamic> maps = json.decode(response.body);
      return maps.map((e) => DataModels.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }

  Future<DataModels> postData({required DataModels datas}) async {
    try {
      final response = await http.post(
        Uri.parse('${Constant.baseUrl}posts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(datas.toJson()),
      );
      final Map<String, dynamic> map = json.decode(response.body);
      return DataModels.fromJson(map);
    } catch (e) {
      debugPrint('Error: $e');
      return DataModels();
    }
  }

  Future<DataModels> deleteData({required int ids}) async {
    try {
      final response = await http.delete(Uri.parse('${Constant.baseUrl}posts/$ids'));
      final Map<String, dynamic> map = json.decode(response.body);
      return DataModels.fromJson(map);
    } catch (e) {
      debugPrint('Error: $e');
      return DataModels();
    }
  }

  Future<DataModels> putData({required DataModels datas}) async {
    try {
      final response = await http.patch(
        Uri.parse('${Constant.baseUrl}posts/${datas.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userId': datas.userId,
          'id': datas.id,
          'title': datas.title,
          'body': datas.body,
        }),
      );
      final Map<String, dynamic> map = json.decode(response.body);
      return DataModels.fromJson(map);
    } catch (e) {
      debugPrint('Error: $e');
      return DataModels();
    }
  }

}
