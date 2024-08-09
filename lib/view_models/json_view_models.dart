import 'package:flutter/material.dart';
import 'package:minimalapp/models/api/json_api.dart';
import 'package:minimalapp/models/api_models.dart';

enum Status {
  success,
  error,
  loading,
}

class JsonViewModels with ChangeNotifier {
  List<DataModels> _data = [];
  Status get status => _status;

  List<DataModels> get data => _data;
  Status _status = Status.loading;

  getData() async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      _data = await JsonApi().getData();
      _status = Status.success;
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}