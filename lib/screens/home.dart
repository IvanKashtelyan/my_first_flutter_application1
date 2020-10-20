import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_application/items/beer_item.dart';
import 'package:my_first_flutter_application/models/BeerModel.dart';
import 'package:my_first_flutter_application/services/beer_api.dart';
import 'package:my_first_flutter_application/util/size_config.dart';

class Home extends StatefulWidget {
  final http.Client httpClient;

  Home({@required this.httpClient}) : assert(httpClient != null);

  @override
  _HomeState createState() => _HomeState(httpClient: this.httpClient);
}

class _HomeState extends State<Home> {
  final http.Client httpClient;

  _HomeState({@required this.httpClient}) : assert(httpClient != null);

  String text = "default";
  int count = 0;
  bool isLoading = false;
  BeerApi api = BeerApi();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  Map data = {};
  List<BeerModel> beers = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = true;
      getBeers();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    // beers = data['beers'] as List<BeerModel>;
    // _listKey.currentState.insertItem(beers.length - 1);
    // page = data['page'];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Beers"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
                child: NotificationListener<ScrollNotification>(
              // ignore: missing_return
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  page += 1;
                  setState(() {
                    // data = {'beers': beers, 'page': page += 1};
                    isLoading = true;
                  });
                  getBeers();
                }
              },
              child: _buildListView(),
            )),
            Container(
              height: isLoading ? 50.0 : 0,
              color: Colors.white70,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ],
        ));
  }

  Widget beerItem(BeerModel beerModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/detail", arguments: {'beer': beerModel});
      },
      child: BeerItem(
          title: beerModel.name,
          id: beerModel.id,
          description: beerModel.description,
          imageUrl: beerModel.imageUrl),
    );
  }

  void getBeers() async {
    List<BeerModel> newBeers = await api.getBeers(page);
    setState(() {
      Future ft = Future(() {});
      newBeers.forEach((element) {
        ft = ft.then((value) {
          return Future.delayed(Duration(milliseconds: 100), () {
            beers.add(element);
            _listKey.currentState.insertItem(beers.length - 1);
          });
        });
      });
      isLoading = false;
    });
  }

  Widget _buildListView() {
    return Container(
        height: SizeConfig.screenHeight,
        child: AnimatedList(
          key: _listKey,
          itemBuilder: (context, index, animation) {
            BeerModel item = beers[index];
            return SlideTransition(
              child: beerItem(item),
              position: animation.drive(_offset),
            );
          },
          initialItemCount: beers.length,
        ));
  }
}
