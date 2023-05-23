import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';

class TransactionModel {
  final String name;
  final String amount;
  final String time;
  final String icon;
  TransactionModel(
      {required this.name,
      required this.amount,
      required this.time,
      required this.icon});
}

final List<TransactionModel> transactionX = [
  TransactionModel(
      name: "Noimot Aderonke Adenola",
      amount: "+56,000",
      time: "8.52 PM",
      icon: AppImage.moneyRight),
  TransactionModel(
      name: "Michael James",
      amount: "-1,130,500",
      time: "8.52 PM",
      icon: AppImage.moneyLeft),
  TransactionModel(
      name: "Noimot Aderonke Adenola",
      amount: "+56,000",
      time: "8.52 PM",
      icon: AppImage.moneyRight),
  TransactionModel(
      name: "Michael James",
      amount: "-1,130,500",
      time: "8.52 PM",
      icon: AppImage.moneyLeft),
  TransactionModel(
      name: "Michael James",
      amount: "-1,130,500",
      time: "8.52 PM",
      icon: AppImage.moneyLeft),
];
