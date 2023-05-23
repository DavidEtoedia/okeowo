import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';
import 'package:okeowo/presentation/screens/home/widget/transaction/model/transaction_model.dart';

class TransactionBuild extends StatelessWidget {
  final TransactionModel model;
  const TransactionBuild({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(model.icon),
          const Space(20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: OkwFont.book,
                      fontSize: 15,
                      letterSpacing: -0.2,
                    ),
              ),
              const Space(3),
              Text(
                model.time,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: OkwFont.book,
                      color: Colors.black26,
                      fontSize: 14.5,
                      letterSpacing: -0.2,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            model.amount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: OkwFont.medium,
                  fontSize: 15,
                  letterSpacing: -0.2,
                ),
          ),
        ],
      ),
    );
  }
}
