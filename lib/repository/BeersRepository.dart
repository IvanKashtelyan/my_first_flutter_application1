import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_first_flutter_application/models/BeerModel.dart';
import 'package:my_first_flutter_application/services/beer_api.dart';

class BeerRepository {
  final BeerApi beerApi;

  BeerRepository({@required this.beerApi}) : assert(beerApi != null);

  Future<List<BeerModel>> getBeers(int page) async {
    return beerApi.getBeers(page);
  }
}
