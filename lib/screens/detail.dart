import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/models/BeerModel.dart';
import 'package:my_first_flutter_application/util/size_config.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map data;
  BeerModel beer;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    beer = data['beer'] as BeerModel;
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(beer.name),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "${beer.imageUrl}",
                        width: SizeConfig.screenWidth * 0.5,
                        height: SizeConfig.screenHeight * 0.4,
                      )
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        child: Text(
                          beer.name,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.9,
                        margin: EdgeInsets.all(15),
                        child: Text(
                          beer.description,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
