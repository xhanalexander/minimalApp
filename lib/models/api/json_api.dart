import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minimalapp/constant/constant.dart';
import 'package:minimalapp/models/api_models.dart';

class JsonApi {
  Future<List<DataModels>> getData() async {
    try {
      final response = await http.get(Uri.parse('${Constant.baseUrl}posts'));
      // debugPrint('Response: ${response.body}');

      final List<dynamic> maps = json.decode(response.body);
      return maps.map((e) => DataModels.fromJson(e)).toList();
      
      /* final List<dynamic> maps = json.decode(response.body);
      debugPrint('Maps: $maps');
      return maps.map((e) => DataModels.fromJson(e)).toList(); */
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}
