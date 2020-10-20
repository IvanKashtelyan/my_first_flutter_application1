import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_first_flutter_application/util/size_config.dart';

class BeerItem extends StatefulWidget {
  int id;
  String description;
  String title;
  String imageUrl;

  BeerItem({this.id, this.title, this.description, this.imageUrl});

  _ItemBeer createState() => _ItemBeer();
}

class _ItemBeer extends State<BeerItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.imageUrl != null
                  ? Image.network(
                      widget.imageUrl,
                      width: 35,
                      height: 35,
                    )
                  : Icon(Icons.error),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: SizeConfig.screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15,
                        wordSpacing: 3,
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.start,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        )
      ],
    );
  }
}
