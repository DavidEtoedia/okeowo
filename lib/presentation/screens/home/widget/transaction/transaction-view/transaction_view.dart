import 'package:flutter/material.dart';
import 'package:okeowo/presentation/screens/home/widget/transaction/model/transaction_model.dart';
import 'package:okeowo/presentation/screens/home/widget/transaction/widget/transaction_build.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transactions",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: OkwFont.medium,
                  fontSize: 17,
                  color: AppColors.primaryColor,
                  letterSpacing: -0.3,
                ),
          ),
          const Space(10),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                children: List.generate(transactionX.length, (index) {
                  var transaction = transactionX[index];
                  return TransactionBuild(
                    model: transaction,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
