import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_application/models/BeerModel.dart';

class BeerApi {
  int _itemPerPage = 20;
  String _baseUrl = "https://api.punkapi.com/v2/beers"; // base api url
  final http.Client httpClient;

  BeerApi({@required this.httpClient}) : assert(httpClient != null);

  Future<List<BeerModel>> getBeers(int page) async {
    var beers = List<BeerModel>();
    Iterable data;
    Response response = await this
        .httpClient
        .get("$_baseUrl?page=$page&per_page=$_itemPerPage");
    if (response.statusCode != 200) {
      throw Exception("error getting beers");
    }

    try {
      data = jsonDecode(response.body);
    } catch (e) {
      Exception("decode error: " + e);
    }

    try {
      data.forEach((element) {
        beers.add(BeerModel.fromJson(element));
      });
    } catch (e) {
      Exception("parse error" + e);
    }

    return beers;
  }
}
