import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_application/bloc/beerBlock.dart';
import 'package:my_first_flutter_application/repository/BeersRepository.dart';
import 'package:my_first_flutter_application/screens/detail.dart';
import 'package:my_first_flutter_application/screens/home.dart';
import 'package:my_first_flutter_application/screens/loading.dart';
import 'package:my_first_flutter_application/services/beer_api.dart';
import 'package:my_first_flutter_application/util/SimpleBlockObserver.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final BeerRepository beerRepository =
      BeerRepository(beerApi: BeerApi(httpClient: http.Client()));
  runApp(MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        home: BlocProvider(
            create: (context) => BeerBloc(beerRepository: beerRepository)),
        routes: {
          // '/': (context) => Loading(),
          '/': (context) => Home(),
          '/detail': (context) => DetailScreen(),
          '/loading': (context) => Loading()
        },
        debugShowCheckedModeBanner: false,
      )));
}
