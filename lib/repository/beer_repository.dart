import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:teeeemj/models/beer_model.dart';

class BeerRepository {
  Future<List<BeerModel>> getBeers() async {
    Dio dio = Dio();
    final Response response = await dio.get('https://api.punkapi.com/v2/beers');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data as List;
      log(response.statusCode.toString());

      return jsonList.map((json) => BeerModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed');
    }
  }
}
