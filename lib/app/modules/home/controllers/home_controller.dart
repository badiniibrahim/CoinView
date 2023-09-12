import 'dart:async';

import 'package:crypto_list/app/modules/home/state.dart';
import 'package:crypto_list/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../../core/abstractions/i_controller.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController with IController {
  final HomeState state = HomeState();
  final HomeRepository _repository = HomeRepository();
  late Timer timer;

  Future<void> fetchQuoteList() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchQuote(15);
        state.quoteList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  Future<void> fetchDataForPieChart() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchQuote(15);
        for (var element in response) {
          VolumeAllCurrencyData data = VolumeAllCurrencyData(
            name: element.shortName,
            value: element.volumeAllCurrencies!.raw,
          );
          state.volumeAllCurrencyData.add(data);
        }
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  @override
  void onInit() {
    fetchDataForPieChart();
    fetchQuoteList();
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      fetchQuoteList();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
