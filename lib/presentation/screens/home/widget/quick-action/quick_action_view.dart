import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/screens/withdraw/withdraw_screen.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_bottom_sheet.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class QuickActionView extends StatelessWidget {
  const QuickActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Actions",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: OkwFont.medium,
                fontSize: 17,
                color: AppColors.primaryColor,
                letterSpacing: -0.3,
              ),
        ),
        const Space(10),
        Row(
          children: List.generate(qA.length, (index) {
            final quickA = qA[index];
            return QuickActionButtons(quickAction: quickA);
          }),
        ),
      ],
    );
  }
}

class QuickActionButtons extends StatelessWidget {
  final QuickAction quickAction;
  const QuickActionButtons({super.key, required this.quickAction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            if (quickAction.name == "Withdraw") {
              await AppBottomSheet.showCustomsheet(context,
                  widget: const WithdrawScreen());
            }
          },
          child: Container(
            width: 75,
            height: 78,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(quickAction.image),
                const Space(6),
                Text(
                  quickAction.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: OkwFont.book,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w300,
                        color: AppColors.primaryColor,
                        letterSpacing: -0.3,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuickAction {
  final String name;
  final String image;
  QuickAction({
    required this.name,
    required this.image,
  });
}

final List<QuickAction> qA = [
  QuickAction(name: "Redeem", image: AppImage.donateCoin),
  QuickAction(name: "Fund Wallet", image: AppImage.moneyIncome),
  QuickAction(name: "Withdraw", image: AppImage.withdraw),
  QuickAction(name: "Scan Code", image: AppImage.barcode),
];
