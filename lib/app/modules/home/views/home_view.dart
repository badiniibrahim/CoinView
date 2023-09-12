import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utilities/size_config.dart';
import '../../../ui/responsive.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  AppBar _appBar() {
    return AppBar(
      title: const Text("Accueil"),
      titleTextStyle: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
        color: AppColors.white,
        fontFamily: 'muli',
      ),
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: _appBar(),
          body: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  pieChartCard(),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: quoteTableCard(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget pieChartCard() {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SfCircularChart(
            title: ChartTitle(text: 'Valeur de chaque devise en USD'),
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              DoughnutSeries<VolumeAllCurrencyData, String>(
                dataSource: controller.state.volumeAllCurrencyData,
                xValueMapper: (VolumeAllCurrencyData v, _) => v.name,
                yValueMapper: (VolumeAllCurrencyData v, _) => v.value,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quoteTableCard(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: DataTable(
          horizontalMargin: 0,
          columnSpacing: 5,
          columns: [
            if (!Responsive.isSmallScreen(context))
              const DataColumn(
                label: Text('Symbol'),
              ),
            const DataColumn(
              label: Text('Nom'),
            ),
            const DataColumn(
              label: Text('Prix'),
            ),
            const DataColumn(
              label: Text('Change'),
            ),
            const DataColumn(
              label: Text('% Change'),
            ),
          ],
          rows: controller.state.quoteList
              .map((quote) => DataRow(
                    cells: [
                      if (!Responsive.isSmallScreen(context))
                        DataCell(
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('${quote.coinImageUrl}'),
                                  radius: 12,
                                ),
                                const SizedBox(width: 5),
                                Text('${quote.symbol}'),
                              ],
                            ),
                          ),
                        ),
                      DataCell(
                        Responsive.isSmallScreen(context)
                            ? Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage('${quote.coinImageUrl}'),
                                      radius: 12,
                                    ),
                                    const SizedBox(width: 5),
                                    Text('${quote.symbol}'),
                                  ],
                                ),
                              )
                            : Text('${quote.shortName}'),
                      ),
                      DataCell(
                        Text(
                          '${quote.regularMarketPrice!.fmt}',
                          style: TextStyle(
                            color: !'${quote.regularMarketPrice!.fmt}'
                                    .startsWith('-')
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '${quote.regularMarketChange!.fmt}',
                          style: TextStyle(
                            color: !'${quote.regularMarketChange!.fmt}'
                                    .startsWith('-')
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '${quote.regularMarketChangePercent!.fmt}',
                          style: TextStyle(
                            color: !'${quote.regularMarketChangePercent!.fmt}'
                                    .startsWith('-')
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class VolumeAllCurrencyData {
  String? name;
  int? value;
  VolumeAllCurrencyData({this.name, this.value});
}
