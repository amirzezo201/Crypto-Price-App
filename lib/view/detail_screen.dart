import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/CoinsModel.dart';

class SingleCoin extends StatelessWidget {
  const SingleCoin(
      {Key? key,
      required this.coinname,
      required this.price,
      required this.marketcap,
      required this.volume,
      required this.sparkline,
      required this.coinImage,
      required this.coinsymbol})
      : super(key: key);
  final String coinname;
  final String price;
  final String marketcap;
  final String volume;
  final List sparkline;
  final String coinImage;
  final String coinsymbol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 35,
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    coinImage,
                    width: 80,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        coinname,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("(${coinsymbol})",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45))
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}