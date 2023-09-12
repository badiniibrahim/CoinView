import 'dart:convert';

import 'package:crypto_list/app/data/models/quote.dart';
import 'package:crypto_list/app/data/providers/home_provider.dart';
import 'package:dio/dio.dart';

import '../../core/abstractions/i_repository.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<List<Quote>> fetchQuote(int count) async {
    final response = await provider.fetchQuote(count);
    var data = response.data['finance']['result'][0]['quotes'] as List;
    List<Quote> list = data.map((q) => Quote.fromJson(q)).toList();
    return list;
  }
}
