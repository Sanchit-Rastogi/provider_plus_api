import 'package:flutter/material.dart';
import 'package:provider_api/Models/api_model.dart';

class ApiData extends ChangeNotifier {
  List<ApiModel> apiData = [];

  void addData(ApiModel data) {
    apiData.add(data);
    notifyListeners();
  }
}
