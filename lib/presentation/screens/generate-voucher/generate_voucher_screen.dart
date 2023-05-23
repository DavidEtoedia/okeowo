import 'package:flutter/material.dart';
import 'package:okeowo/presentation/screens/generate-voucher/widget/generate_successful.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/appbutton/app_button.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/components/textform/textfield_input.dart';
import 'package:okeowo/presentation/utils/helpers/app_bottom_sheet.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';
import 'package:okeowo/presentation/utils/helpers/currency-formater/currency_formater.dart';

class GenerateVoucherScreen extends StatefulWidget {
  const GenerateVoucherScreen({super.key});

  @override
  State<GenerateVoucherScreen> createState() => _GenerateVoucherScreenState();
}

class _GenerateVoucherScreenState extends State<GenerateVoucherScreen> {
  final TextEditingController amount = TextEditingController();
  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              const AppBackButton(title: "Generate Payment Voucher"),
              const Space(20),
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Text(
                  "Enter an amount you want to generate a voucher for.",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontFamily: OkwFont.book,
                        letterSpacing: -0.3,
                        fontSize: 15,
                      ),
                ),
              ),
              const Space(20),
              const AvailableBalance(
                subText: "Available Balance - NGN 450,900.78",
              ),
              const Space(6),
              TextFormInput(
                  controller: amount,
                  labelText: "Enter amount",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 10),
                    child: Text("₦",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.black26,
                              letterSpacing: -0.3,
                              fontSize: 15,
                            )),
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(symbol: '₦', decimalDigits: 0)
                  ],
                  validator: (v) => null),
              const Space(20),
              BCButton(
                  onPressed: () async {
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    await AppBottomSheet.showCustomsheet(context,
                        widget: const GenerationSuccessful());
                  },
                  text: "Generate Voucher")
            ],
          ),
        ),
      ),
    );
  }
}

class AvailableBalance extends StatelessWidget {
  final String subText;
  final String text;
  const AvailableBalance({super.key, this.subText = "", this.text = "Amount"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primaryColor,
                fontFamily: OkwFont.medium,
                letterSpacing: -0.3,
                fontSize: 14,
              ),
        ),
        const Spacer(),
        Text(
          subText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.grey.shade400,
                fontFamily: OkwFont.book,
                letterSpacing: -0.3,
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
}
