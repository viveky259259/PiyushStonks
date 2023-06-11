import 'package:flutter_app/utensil/pigeon.dart';

class StocksRepository {
  final StockApi stockService;

  StocksRepository({required this.stockService});

  Future<List<Stock?>> retrieveStocks(String ticker, String function) async {
    final fetchedStocks = await stockService.getStocks(ticker, function);
    return fetchedStocks.whereType<Stock>().toList();
  }
}
