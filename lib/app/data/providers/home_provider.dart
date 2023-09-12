import 'package:dio/dio.dart';

import '../../core/abstractions/i_provider.dart';
import '../../core/provider/api_provider.dart';

class HomeProvider extends IProvider<Response> {
  @override
  String get endpoint =>
      "/finance/screener/predefined/saved?formatted=true&scrIds=all_cryptocurrencies_us&start=0&count=";

  Future<Response> fetchQuote(int count) async {
    return await ApiProvider.instance.get(
      endpoint: "$endpoint$count",
    );
  }
}
