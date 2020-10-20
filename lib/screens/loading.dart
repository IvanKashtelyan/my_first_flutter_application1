import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_first_flutter_application/models/BeerModel.dart';
import 'package:my_first_flutter_application/services/beer_api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int page = 1;
  BeerApi api = BeerApi();

  void getBeers() async {
    List<BeerModel> beers = await api.getBeers(this.page);
    Navigator.pushReplacementNamed(context, "/home",
        arguments: {'beers': beers, 'page': page}); // open main screen
  }

  @override
  void initState() {
    super.initState();
    getBeers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
