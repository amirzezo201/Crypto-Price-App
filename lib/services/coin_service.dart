import 'package:dio/dio.dart';

import '../models/CoinsModel.dart';
class CoinApi{

  static String apiurl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h";
  static Future<List<CoinMarketModel>> getcoins() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(apiurl);
      List<CoinMarketModel> productList = List.empty(growable: true);
      for(int i=0; i<response.data.length; i++){
        productList.add(CoinMarketModel.fromJson(response.data[i]));
      }
      return productList;

    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }
}