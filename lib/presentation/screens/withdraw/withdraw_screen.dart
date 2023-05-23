import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okeowo/presentation/screens/generate-voucher/generate_voucher_screen.dart';
import 'package:okeowo/presentation/screens/withdraw/widget/tap_generate_otp.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/app_image/app_image.dart';
import 'package:okeowo/presentation/utils/components/appbutton/app_button.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/components/textform/textfield_input.dart';
import 'package:okeowo/presentation/utils/helpers/app_spacer.dart';
import 'package:okeowo/presentation/utils/helpers/currency-formater/currency_formater.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController amount = TextEditingController();
  final TextEditingController acNumber = TextEditingController();
  final TextEditingController otp = TextEditingController();
  final TextEditingController remark = TextEditingController();
  @override
  void dispose() {
    amount.dispose();
    acNumber.dispose();
    otp.dispose();
    remark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
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
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    const Space(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text("Withdraw",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontFamily: OkwFont.medium,
                                      letterSpacing: -0.3,
                                      fontSize: 16.5,
                                    )),
                        const Spacer(),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                            child: const Center(
                                child: Icon(
                              Icons.close,
                              size: 13,
                            )),
                          ),
                        )
                      ],
                    ),
                    const Space(20),
                    Text(
                      "Use the form below to withdraw from your MTOKEN account instantly.",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: OkwFont.book,
                            letterSpacing: -0.3,
                            fontSize: 15,
                          ),
                    ),
                    const Space(24),
                    const TapGenerateOTP(),
                    const Space(20),
                    const AvailableBalance(
                      subText: "Available Balance - NGN 450,900.78",
                    ),
                    const Space(10),
                    TextFormInput(
                        controller: amount,
                        labelText: "Enter amount",
                        keyboardType: TextInputType.number,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13, left: 10),
                          child: Text("₦",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Colors.black26,
                                    letterSpacing: -0.3,
                                    fontSize: 15,
                                  )),
                        ),
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              symbol: '₦', decimalDigits: 0)
                        ],
                        validator: (v) => null),
                    const Space(15),
                    const AvailableBalance(
                      text: "Select Destination",
                    ),
                    const Space(10),
                    TextFormInput(
                        controller: amount,
                        labelText: "Select bank",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            AppImage.bank,
                            height: 10,
                            width: 10,
                          ),
                        ),
                        suffixIcon: const Icon(Icons.expand_more),
                        validator: (v) => null),
                    const Space(15),
                    const AvailableBalance(
                      text: "Account Number",
                    ),
                    const Space(10),
                    TextFormInput(
                        controller: acNumber,
                        keyboardType: TextInputType.number,
                        labelText: "Enter account number",
                        validator: (v) => null),
                    const Space(15),
                    const AvailableBalance(
                      text: "OTP ",
                    ),
                    const Space(10),
                    TextFormInput(
                        controller: otp,
                        keyboardType: TextInputType.number,
                        labelText: "Enter OTP ",
                        validator: (v) => null),
                    const Space(15),
                    const AvailableBalance(
                      text: "Remarks",
                    ),
                    const Space(10),
                    TextFormInput(
                        controller: remark,
                        labelText: "Enter Remarks ",
                        validator: (v) => null),
                    const Space(30),
                    BCButton(
                        onPressed: () {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        text: "Withdraw Now"),
                    const Space(30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
