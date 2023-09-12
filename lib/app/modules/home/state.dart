import 'package:crypto_list/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../data/models/quote.dart';

class HomeState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<Quote> _quoteList = <Quote>[].obs;
  set quoteList(value) => _quoteList.value = value;
  List<Quote> get quoteList => _quoteList;

  final RxList<VolumeAllCurrencyData> _volumeAllCurrencyData =
      <VolumeAllCurrencyData>[].obs;
  set volumeAllCurrencyData(value) => _volumeAllCurrencyData.value = value;
  List<VolumeAllCurrencyData> get volumeAllCurrencyData =>
      _volumeAllCurrencyData;
}
