import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class AppBackButton extends StatelessWidget {
  final String title;
  final bool isShadow;
  final Color textColor;
  final Function()? onPressed;
  final Widget widget;
  const AppBackButton(
      {super.key,
      required this.title,
      this.isShadow = true,
      this.onPressed,
      this.widget = const SizedBox.shrink(),
      this.textColor = AppColors.titleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(17.r),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15,
          ),
        ),
        // Space(30.w),
        const Spacer(),
        Text(title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColor,
                  fontFamily: OkwFont.medium,
                  letterSpacing: -0.3,
                  fontSize: 15,
                )),
        if (widget != const SizedBox.shrink()) ...[const Spacer(), widget]
      ],
    );
  }
}

class BCButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double height;
  final Color color;
  final bool isLoading;
  final bool withBorder;
  final String image;
  final Color textColor;
  const BCButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.withBorder = false,
    this.isLoading = false,
    this.image = "",
    this.height = 55,
    this.textColor = Colors.white,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: withBorder
                ? const BorderSide(
                    width: 1,
                    color: Colors.black26,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10).r,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image.isNotEmpty) ...[SvgPicture.asset(image), Space(10.w)],
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                    fontFamily: OkwFont.medium,
                    fontSize: 18.sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool withIcon;
  final bool isBold;
  final Color bgColor;
  final void Function()? onPressed;
  const ClickableText(
      {super.key,
      required this.color,
      required this.text,
      this.withIcon = false,
      this.isBold = false,
      this.bgColor = Colors.transparent,
      this.textSize = 15.0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        backgroundColor: bgColor,
        elevation: 0,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: textSize,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withIcon) ...[
            const Icon(
              Icons.tune,
              color: AppColors.primaryColor,
            ),
            Space(10.w),
          ],
          Text(
            text,
            style: isBold
                ? Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: color,
                      fontSize: textSize,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w900,
                    )
                : Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: color,
                      fontSize: textSize,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
          ),
        ],
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonBack({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(15, 45),
        maximumSize: const Size(50, 60),
        shadowColor: Colors.grey.shade100,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17).r,
        ),
        elevation: 2,
      ),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}

class ButtonBack2 extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isShadow;
  const ButtonBack2({super.key, required this.onPressed, this.isShadow = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(17.r),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: [
          if (isShadow) ...[
            BoxShadow(
                color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 2)
          ]
        ], color: Colors.white, borderRadius: BorderRadius.circular(13.r)),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool withIcon;
  final void Function()? onPressed;
  const SmallButton(
      {super.key,
      required this.color,
      required this.text,
      this.withIcon = false,
      this.textSize = 13.5,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.green,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontSize: textSize,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );

    // TextButton(
    //   onPressed: onPressed,
    //   style: TextButton.styleFrom(
    //     elevation: 0,
    //     textStyle: TextStyle(
    //       fontWeight: FontWeight.w600,
    //       fontSize: textSize,
    //     ),
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (withIcon) ...[
    //         const Icon(
    //           Icons.tune,
    //           color: AppColors.secondaryColor,
    //         ),
    //       ],
    //       Space(10.w),
    //       Text(
    //         text,
    //         style: Theme.of(context).textTheme.labelSmall?.copyWith(
    //               color: color,
    //               fontSize: textSize,
    //               letterSpacing: 0.6,
    //               fontWeight: FontWeight.w500,
    //             ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
