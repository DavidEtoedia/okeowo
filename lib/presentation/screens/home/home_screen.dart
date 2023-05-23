// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:okeowo/presentation/screens/generate-voucher/generate_voucher_screen.dart';
import 'package:okeowo/presentation/screens/home/widget/quick-action/quick_action_view.dart';
import 'package:okeowo/presentation/screens/home/widget/transaction/transaction-view/transaction_view.dart';

import 'package:okeowo/presentation/screens/home/widget/user_display_name.dart';
import 'package:okeowo/presentation/screens/home/widget/wallet_amount_view.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appbutton/app_button.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';
import 'package:okeowo/presentation/utils/helpers/navigator/navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              const DisplayName(),
              const Space(30),
              const WalletAmountDisplay(),
              const Space(20),
              BCButton(
                  onPressed: () => context
                      .navigate(const GenerateVoucherScreen(), isCustom: true),
                  image: AppImage.money,
                  text: "Generate Payment Voucher"),
              const Space(25),
              const QuickActionView(),
              const Space(20),
              const TransactionView()
            ],
          ),
        ),
      ),
    );
  }
}
