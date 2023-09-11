import 'dart:convert';

import 'package:flutter/services.dart';

class MockAssetsLoaderService{
  static Future<dynamic> getMockJson(String uri)async{
    final mockData = await rootBundle.loadString(uri);
    return jsonDecode(mockData);
  }
}