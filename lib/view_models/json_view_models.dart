import 'package:flutter/material.dart';
import 'package:minimalapp/models/api/json_api.dart';
import 'package:minimalapp/models/api_models.dart';

enum Status {
  success,
  error,
  loading,
}

class JsonViewModels with ChangeNotifier {
  List<DataModels> _getData = [];
  DataModels _getSearchData = DataModels();
  DataModels _getDetailsData = DataModels();
  DataModels _updateData = DataModels();

  int currentPage = 1;
  final int limit = 10;
  bool hasMore = true;
  
  Status get status => _status;

  List<DataModels> get data => _getData;
  DataModels get searchData => _getSearchData;
  DataModels get detailsData => _getDetailsData;
  DataModels get updateData => _updateData;
  Status _status = Status.loading;

  deleteData({required int id}) async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      await JsonApi().deleteData(ids: id);
      _status = Status.success;
      notifyListeners();

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  getDataList({required int pages, required int limits}) async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      _getData = await JsonApi().getDataList(page: pages, limit: limits);
      _status = Status.success;
      notifyListeners();

    } catch (e) {
      debugPrint('> Error View Models: $e');
      _status = Status.error;
      throw Exception('Error: $e');
    }
  }

  getSingleData({required int id}) async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      _getSearchData = await JsonApi().getIds(ids: id);
      _status = Status.success;
      notifyListeners();

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  postData({required DataModels data}) async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      await JsonApi().postData(datas: data);
      _status = Status.success;
      notifyListeners();

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  putData({required DataModels data}) async {
    try {
      _status = Status.loading;
      notifyListeners();
      
      _updateData = await JsonApi().putData(datas: data);
      _status = Status.success;
      notifyListeners();

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }
  
}