import '/services/coin_service.dart';
import 'package:flutter/material.dart';
import '../models/CoinsModel.dart';
import 'widgets/coin_tiles.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


@override
class _HomeScreenState extends State<HomeScreen> {
  late List<CoinMarketModel> coinlist = List.empty(growable: true);
  bool dataLoaded = false;
  void getCoindata() async {
    await CoinApi.getcoins().then(
      (value) {
        if (value != null) {
          coinlist = value;
          setState(() {
            dataLoaded = true;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCoindata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Coin Market",
            style: TextStyle(color: Colors.black26, fontSize: 28),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Cointiles(coinlist: coinlist)),
          ],
        )
        );
  }
}

