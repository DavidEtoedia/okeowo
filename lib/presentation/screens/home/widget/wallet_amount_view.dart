import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class WalletAmountDisplay extends StatefulWidget {
  const WalletAmountDisplay({
    super.key,
  });

  @override
  State<WalletAmountDisplay> createState() => _WalletAmountDisplayState();
}

class _WalletAmountDisplayState extends State<WalletAmountDisplay> {
  bool obsure = false;
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(17),
      width: screenW,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "MTOKEN WALLET",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: OkwFont.book,
                      fontSize: 15,
                      color: AppColors.lableColor,
                      letterSpacing: -0.3,
                    ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    setState(() => obsure = !obsure);
                  },
                  child: SvgPicture.asset(AppImage.eye)),
            ],
          ),
          const Space(10),
          Text(
            obsure ? "**********" : "NGN 450,900.78",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: OkwFont.medium,
                fontSize: 19,
                color: AppColors.secondaryColor),
          ),
          const Space(10),
          Text(
            "Eniola Michael",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.lableColor,
                  fontFamily: OkwFont.book,
                  letterSpacing: -0.3,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
