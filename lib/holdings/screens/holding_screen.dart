import 'package:flutter/material.dart';

import 'package:flutter_app/data/network/stocks_invested_repository.dart';
import 'package:flutter_app/holdings/widgets/holding_list.dart';
import 'package:flutter_app/holdings/provider/holdings_provider.dart';
import 'package:flutter_app/utensil/constants/colors.dart';
import 'package:flutter_app/utensil/constants/text_styles.dart';
import 'package:provider/provider.dart';

import '../../utensil/pigeon.dart';

class HoldingScreen extends StatelessWidget {
  const HoldingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final api = GetInvestedStock();
    final investRepository = HoldingsRepository(stockService: api);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HoldingsProvider>(
          create: (_) => HoldingsProvider(repository: investRepository),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background(),
        appBar: AppBar(
          title: Text(
            'My Holdings',
            style: TextStyles.bold20.textColor(),
          ),
          backgroundColor: AppColors.background(),
          elevation: 0,
        ),
        body: const HoldingList(),
      ),
    );
  }
}
