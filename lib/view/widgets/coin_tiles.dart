import 'package:flutter/material.dart';

import '../../models/CoinsModel.dart';
import '../detail_screen.dart';

class Cointiles extends StatelessWidget {
  const Cointiles({
    Key? key,
    required this.coinlist,
  }) : super(key: key);

  final List<CoinMarketModel> coinlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: coinlist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleCoin(
                          coinname: coinlist[index].name,
                          marketcap: coinlist[index].marketCap.toString(),
                          price: coinlist[index].currentPrice.toString(),
                          sparkline: coinlist[index].sparklineIn7D.price,
                          volume: coinlist[index].totalVolume.toString(),
                          coinImage: coinlist[index].image,
                          coinsymbol: coinlist[index].symbol.toUpperCase(),
                        ))),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                coinlist[index].image,
                                width: 70,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coinlist[index].symbol.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  coinlist[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coinlist[index].currentPrice.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            coinlist[index]
                                    .priceChangePercentage24H
                                    .toString() +
                                "%",
                            style: TextStyle(
                              color:
                                  coinlist[index].priceChangePercentage24H < 0
                                      ? Colors.red
                                      : Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    )
                  ]),
            ),
          );
        });
  }
}
