import 'package:dio/dio.dart';

import '../models/model.dart';

class ApiServiceMap {
  Future<SerModel> getBranches() async {
    final dio = Dio();
    final response = await dio
        .get('https://gateway.texnomart.uz/api/web/v1/region/stores-list');
    return SerModel.fromJson(response.data);
  }
}
