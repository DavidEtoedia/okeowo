import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class TapGenerateOTP extends StatelessWidget {
  const TapGenerateOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 23),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "2FA: TAP TO GENERATE OTP",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.grey,
                      fontFamily: OkwFont.book,
                      letterSpacing: -0.3,
                      fontSize: 14.5,
                    ),
              ),
              const Spacer(),
              SvgPicture.asset(AppImage.phoneLock),
            ],
          ),
          const Space(20),
          Text(
            "2FA is required to complete this process. Please tap to generate OTP then come back to proceed.",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                  fontFamily: OkwFont.book,
                  letterSpacing: -0.3,
                  fontSize: 14.5,
                ),
          ),
        ],
      ),
    );
  }
}
