// Autogenerated from Pigeon (v9.1.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface Stock ()
+ (Stock *)fromList:(NSArray *)list;
+ (nullable Stock *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface StockInvest ()
+ (StockInvest *)fromList:(NSArray *)list;
+ (nullable StockInvest *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface MyRequest ()
+ (MyRequest *)fromList:(NSArray *)list;
+ (nullable MyRequest *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface MyResponse ()
+ (MyResponse *)fromList:(NSArray *)list;
+ (nullable MyResponse *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation Stock
+ (instancetype)makeWithSymbol:(nullable NSString *)symbol
    name:(nullable NSString *)name
    price:(nullable NSNumber *)price
    date:(nullable NSString *)date
    change:(nullable NSNumber *)change
    percentChange:(nullable NSNumber *)percentChange {
  Stock* pigeonResult = [[Stock alloc] init];
  pigeonResult.symbol = symbol;
  pigeonResult.name = name;
  pigeonResult.price = price;
  pigeonResult.date = date;
  pigeonResult.change = change;
  pigeonResult.percentChange = percentChange;
  return pigeonResult;
}
+ (Stock *)fromList:(NSArray *)list {
  Stock *pigeonResult = [[Stock alloc] init];
  pigeonResult.symbol = GetNullableObjectAtIndex(list, 0);
  pigeonResult.name = GetNullableObjectAtIndex(list, 1);
  pigeonResult.price = GetNullableObjectAtIndex(list, 2);
  pigeonResult.date = GetNullableObjectAtIndex(list, 3);
  pigeonResult.change = GetNullableObjectAtIndex(list, 4);
  pigeonResult.percentChange = GetNullableObjectAtIndex(list, 5);
  return pigeonResult;
}
+ (nullable Stock *)nullableFromList:(NSArray *)list {
  return (list) ? [Stock fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.symbol ?: [NSNull null]),
    (self.name ?: [NSNull null]),
    (self.price ?: [NSNull null]),
    (self.date ?: [NSNull null]),
    (self.change ?: [NSNull null]),
    (self.percentChange ?: [NSNull null]),
  ];
}
@end

@implementation StockInvest
+ (instancetype)makeWithSymbol:(nullable NSString *)symbol
    name:(nullable NSString *)name
    investedTotal:(nullable NSNumber *)investedTotal
    quantity:(nullable NSNumber *)quantity
    currentValue:(nullable NSNumber *)currentValue
    pl:(nullable NSNumber *)pl
    percentagePL:(nullable NSNumber *)percentagePL
    averagePrice:(nullable NSNumber *)averagePrice
    ltp:(nullable NSNumber *)ltp {
  StockInvest* pigeonResult = [[StockInvest alloc] init];
  pigeonResult.symbol = symbol;
  pigeonResult.name = name;
  pigeonResult.investedTotal = investedTotal;
  pigeonResult.quantity = quantity;
  pigeonResult.currentValue = currentValue;
  pigeonResult.pl = pl;
  pigeonResult.percentagePL = percentagePL;
  pigeonResult.averagePrice = averagePrice;
  pigeonResult.ltp = ltp;
  return pigeonResult;
}
+ (StockInvest *)fromList:(NSArray *)list {
  StockInvest *pigeonResult = [[StockInvest alloc] init];
  pigeonResult.symbol = GetNullableObjectAtIndex(list, 0);
  pigeonResult.name = GetNullableObjectAtIndex(list, 1);
  pigeonResult.investedTotal = GetNullableObjectAtIndex(list, 2);
  pigeonResult.quantity = GetNullableObjectAtIndex(list, 3);
  pigeonResult.currentValue = GetNullableObjectAtIndex(list, 4);
  pigeonResult.pl = GetNullableObjectAtIndex(list, 5);
  pigeonResult.percentagePL = GetNullableObjectAtIndex(list, 6);
  pigeonResult.averagePrice = GetNullableObjectAtIndex(list, 7);
  pigeonResult.ltp = GetNullableObjectAtIndex(list, 8);
  return pigeonResult;
}
+ (nullable StockInvest *)nullableFromList:(NSArray *)list {
  return (list) ? [StockInvest fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.symbol ?: [NSNull null]),
    (self.name ?: [NSNull null]),
    (self.investedTotal ?: [NSNull null]),
    (self.quantity ?: [NSNull null]),
    (self.currentValue ?: [NSNull null]),
    (self.pl ?: [NSNull null]),
    (self.percentagePL ?: [NSNull null]),
    (self.averagePrice ?: [NSNull null]),
    (self.ltp ?: [NSNull null]),
  ];
}
@end

@implementation MyRequest
+ (instancetype)makeWithId:(nullable NSString *)id
    ticker:(nullable NSString *)ticker
    function:(nullable NSString *)function {
  MyRequest* pigeonResult = [[MyRequest alloc] init];
  pigeonResult.id = id;
  pigeonResult.ticker = ticker;
  pigeonResult.function = function;
  return pigeonResult;
}
+ (MyRequest *)fromList:(NSArray *)list {
  MyRequest *pigeonResult = [[MyRequest alloc] init];
  pigeonResult.id = GetNullableObjectAtIndex(list, 0);
  pigeonResult.ticker = GetNullableObjectAtIndex(list, 1);
  pigeonResult.function = GetNullableObjectAtIndex(list, 2);
  return pigeonResult;
}
+ (nullable MyRequest *)nullableFromList:(NSArray *)list {
  return (list) ? [MyRequest fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.id ?: [NSNull null]),
    (self.ticker ?: [NSNull null]),
    (self.function ?: [NSNull null]),
  ];
}
@end

@implementation MyResponse
+ (instancetype)makeWithId:(nullable NSString *)id
    result:(nullable NSArray<Stock *> *)result {
  MyResponse* pigeonResult = [[MyResponse alloc] init];
  pigeonResult.id = id;
  pigeonResult.result = result;
  return pigeonResult;
}
+ (MyResponse *)fromList:(NSArray *)list {
  MyResponse *pigeonResult = [[MyResponse alloc] init];
  pigeonResult.id = GetNullableObjectAtIndex(list, 0);
  pigeonResult.result = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable MyResponse *)nullableFromList:(NSArray *)list {
  return (list) ? [MyResponse fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.id ?: [NSNull null]),
    (self.result ?: [NSNull null]),
  ];
}
@end

@interface MyApiCodecReader : FlutterStandardReader
@end
@implementation MyApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [MyRequest fromList:[self readValue]];
    case 129: 
      return [MyResponse fromList:[self readValue]];
    case 130: 
      return [Stock fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MyApiCodecWriter : FlutterStandardWriter
@end
@implementation MyApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[MyRequest class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[MyResponse class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[Stock class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MyApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MyApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MyApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MyApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MyApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MyApiCodecReaderWriter *readerWriter = [[MyApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void MyApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<MyApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.MyApi.getStocksInfo"
        binaryMessenger:binaryMessenger
        codec:MyApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getStocksInfoRequest:completion:)], @"MyApi api (%@) doesn't respond to @selector(getStocksInfoRequest:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        MyRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        [api getStocksInfoRequest:arg_request completion:^(MyResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface StockApiCodecReader : FlutterStandardReader
@end
@implementation StockApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [Stock fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface StockApiCodecWriter : FlutterStandardWriter
@end
@implementation StockApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[Stock class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface StockApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation StockApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[StockApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[StockApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *StockApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    StockApiCodecReaderWriter *readerWriter = [[StockApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void StockApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<StockApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.StockApi.getStocks"
        binaryMessenger:binaryMessenger
        codec:StockApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getStocksTicker:function:completion:)], @"StockApi api (%@) doesn't respond to @selector(getStocksTicker:function:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_ticker = GetNullableObjectAtIndex(args, 0);
        NSString *arg_function = GetNullableObjectAtIndex(args, 1);
        [api getStocksTicker:arg_ticker function:arg_function completion:^(NSArray<Stock *> *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface StockInvestApiCodecReader : FlutterStandardReader
@end
@implementation StockInvestApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [StockInvest fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface StockInvestApiCodecWriter : FlutterStandardWriter
@end
@implementation StockInvestApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[StockInvest class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface StockInvestApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation StockInvestApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[StockInvestApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[StockInvestApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *StockInvestApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    StockInvestApiCodecReaderWriter *readerWriter = [[StockInvestApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void StockInvestApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<StockInvestApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.StockInvestApi.getStocksInvest"
        binaryMessenger:binaryMessenger
        codec:StockInvestApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getStocksInvestWithCompletion:)], @"StockInvestApi api (%@) doesn't respond to @selector(getStocksInvestWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api getStocksInvestWithCompletion:^(NSArray<StockInvest *> *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}