import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard/provider/dashboard_provider.dart';
import 'package:flutter_app/data/network/stock_suggestion.dart';
import 'package:flutter_app/utensil/constants/colors.dart';
import 'package:flutter_app/utensil/constants/text_styles.dart';
import 'package:flutter_app/utensil/pigeon.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../holdings/screens/holding_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Stock> listStock = [];

  @override
  void initState() {
    super.initState();
  }

  String searchValue = '';

  double currentChartData = 0;
  void _onTouch(FlTouchEvent event, LineTouchResponse? response) {
    if (event is FlTapDownEvent ||
        event is FlLongPressMoveUpdate ||
        event is FlPanDownEvent ||
        event is FlPanUpdateEvent) {
      final index = response?.lineBarSpots?.first.x;

      if (index == null) {
        return;
      }

      setState(() {
        tooltipDate = dashboardProvider.chartData[index.toInt()].date ?? '';
        currentChartData =
            dashboardProvider.chartData[index.toInt()].price ?? 0;
      });
    } else if (event is FlLongPressEnd ||
        event is FlTapUpEvent ||
        event is FlPanEndEvent) {
      setState(() {
        currentChartData = dashboardProvider.chartData.last.price ?? 0;
        tooltipDate = '';
      });
    }
  }

  String searchText = '';
  String tooltipDate = '';
  late DashboardProvider dashboardProvider;
  final formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    dashboardProvider = context.watch<DashboardProvider>();
    return Consumer<DashboardProvider>(
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.background(),
          appBar: EasySearchBar(
            title: const Text('Stocks'),
            onSuggestionTap: (data) => {
              FocusScope.of(context).unfocus(),
              dashboardProvider.fetchStocks(data, "TIME_SERIES_WEEKLY")
            },
            onSearch: (value) => setState(() => searchValue = value),
            suggestions: suggestions,
          ),
          body: _buildChart(),
        ),
      ),
    );
  }

  Widget title() {
    currentChartData = currentChartData == 0
        ? (dashboardProvider.chartData.last.price ?? 0)
        : currentChartData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Text(
            "${dashboardProvider.chartData[0].symbol}: ",
            textAlign: TextAlign.left,
            style: TextStyles.bold22.withPrimary(),
          ),
          Text(
            formatCurrency.format(currentChartData),
            textAlign: TextAlign.left,
            style: TextStyles.bold22.withPrimary(),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Column(
      children: [
        if (dashboardProvider.chartData.isNotEmpty) ...[
          title(),
        ],
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 140,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: dashboardProvider.chartData.length.toDouble() - 1,
                  minY: minPrice(dashboardProvider.chartData),
                  maxY: maxPrice(dashboardProvider.chartData),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchCallback: _onTouch,
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> indicators) {
                      return indicators.map((int index) {
                        final flLine =
                            FlLine(color: AppColors.accent(), strokeWidth: 0);

                        final dotData = FlDotData(
                          getDotPainter: (spot, percent, bar, index) =>
                              FlDotCirclePainter(
                            radius: 5,
                            color: AppColors.accent(),
                            strokeColor: AppColors.accent(),
                          ),
                        );

                        return TouchedSpotIndicatorData(flLine, dotData);
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      // maxContentWidth: 0,
                      // tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(4),
                      getTooltipItems: (_) {
                        TextStyle textStyle = TextStyle(
                          color: AppColors.accent(),
                          fontSize: 14,
                        );
                        return [LineTooltipItem(tooltipDate, textStyle)];
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      color: AppColors.positive(),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.positive(),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.positive().withOpacity(0),
                            AppColors.positive().withOpacity(0),
                            AppColors.positive().withOpacity(0.75),
                            AppColors.positive()
                          ],
                          begin: const Alignment(.50, 1.70),
                          end: const Alignment(0.5, -0.4),
                        ),
                      ),
                      spots: dashboardProvider.chartData
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final point = entry.value;

                        return FlSpot(index.toDouble(), point.price ?? 0);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            if (dashboardProvider.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HoldingScreen()),
            );
          },
          child: const Text('Open Investments'),
        ),
      ],
    );
  }
}

double? minPrice(List<Stock> stock) {
  if (stock.isEmpty) {
    return 0;
  }

  if (stock.length == 1) {
    return stock.first.price ?? 0;
  }

  return stock
      .reduce((previousValue, element) =>
          (previousValue.price ?? 0) < (element.price ?? 0)
              ? previousValue
              : element)
      .price;
}

double? maxPrice(List<Stock> stock) {
  if (stock.isEmpty) {
    return 0;
  }

  if (stock.length == 1) {
    return stock.first.price;
  }

  return stock
      .reduce((previousValue, element) =>
          (previousValue.price ?? 0) > (element.price ?? 0)
              ? previousValue
              : element)
      .price;
}
