import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1) //typeId should be unique for each model
class Transaction extends HiveObject {
  @HiveField(0) //unique id for each field
  String recipient;

  @HiveField(1)
  num amount;

  @HiveField(2)
  String dateTime;

  Transaction({
    required this.recipient,
    required this.amount,
    required this.dateTime,
  });
}
