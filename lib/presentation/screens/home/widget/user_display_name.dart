import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImage.user),
        const Space(20),
        Text(
          "Welcome Eniola",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: OkwFont.medium,
                letterSpacing: -0.2,
              ),
        ),
      ],
    );
  }
}
