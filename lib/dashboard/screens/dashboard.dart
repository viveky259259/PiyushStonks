import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard/provider/dashboard_provider.dart';
import 'package:flutter_app/dashboard/widgets/chart.dart';
import 'package:flutter_app/data/network/stock_suggestion.dart';
import 'package:flutter_app/utensil/constants/colors.dart';
import 'package:flutter_app/utensil/pigeon.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Stock> listStock = [];
  String searchValue = '';

  late DashboardProvider dashboardProvider;

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
            onSuggestionTap: (data) async {
              FocusScope.of(context).unfocus();
              await dashboardProvider.fetchStocks(data, "TIME_SERIES_WEEKLY");
            },
            onSearch: (value) => setState(() => searchValue = value),
            suggestions: suggestions,
          ),
          body: SingleChildScrollView(child: AssetChart(dashboardProvider)),
        ),
      ),
    );
  }
}
