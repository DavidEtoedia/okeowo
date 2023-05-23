import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okeowo/presentation/screens/main_navigation.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appbutton/app_button.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';
import 'package:okeowo/presentation/utils/helpers/navigator/navigator.dart';

class GenerationSuccessful extends StatelessWidget {
  const GenerationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9),
            topRight: Radius.circular(9),
          ))),
      child: Column(
        children: [
          const Space(10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
          ),
          const Space(20),
          Text("Generation Successful",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: OkwFont.medium,
                    letterSpacing: -0.3,
                    fontSize: 16.5,
                  )),
          const Space(20),
          Text(
            "Voucher code generated successfully. Copy or share the code to the receipient for them to redeem it.",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontFamily: OkwFont.book,
                  letterSpacing: -0.3,
                  fontSize: 15.5,
                ),
          ),
          const Space(24),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 23),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9), color: AppColors.cFill),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImage.moneyLeft),
                    const Space(10),
                    Text(
                      "Voucher Balance",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Colors.grey,
                            fontFamily: OkwFont.book,
                            letterSpacing: -0.3,
                            fontSize: 15.5,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      "NGN 50,900.78",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: OkwFont.medium,
                            letterSpacing: -0.3,
                            fontSize: 15.0,
                          ),
                    ),
                  ],
                ),
                const Space(20),
                Row(
                  children: [
                    SvgPicture.asset(AppImage.ticket),
                    const Space(10),
                    Text(
                      "Generated Code",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Colors.grey,
                            fontFamily: OkwFont.book,
                            letterSpacing: -0.3,
                            fontSize: 15.5,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      "987-567-890",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: OkwFont.medium,
                            letterSpacing: -0.3,
                            fontSize: 15.0,
                          ),
                    ),
                  ],
                ),
                const Space(24),
                Row(
                  children: [
                    Expanded(
                        child: BCButton(
                            withBorder: true,
                            height: 45,
                            color: Colors.transparent,
                            textColor: AppColors.primaryColor,
                            image: AppImage.copy,
                            onPressed: () {},
                            text: "Copy Code")),
                    const Space(10),
                    Expanded(
                        child: BCButton(
                            withBorder: true,
                            height: 45,
                            color: Colors.transparent,
                            textColor: AppColors.primaryColor,
                            image: AppImage.share,
                            onPressed: () {},
                            text: "Share Code"))
                  ],
                )
              ],
            ),
          ),
          const Space(15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppImage.info),
              const Space(10),
              Expanded(
                child: Text(
                  "Voucher status can be viewed in the transaction screen. ",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.grey,
                        fontFamily: OkwFont.book,
                        letterSpacing: -0.3,
                        fontSize: 15.5,
                      ),
                ),
              ),
            ],
          ),
          const Spacer(),
          BCButton(
              onPressed: () => context.navigateReplace(
                    const MainScreen(),
                  ),
              text: "Return to home screen"),
          const Space(30),
        ],
      ),
    );
  }
}
