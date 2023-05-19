import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/constants/snackbar.dart';
import 'package:testly/constants/strings.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/src/widgets/text_inputs.dart';
import 'package:testly/util.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OTPScreenArguments;
    OtpFieldController otpController = OtpFieldController();

    void onOTPFilled(String pin) {
      final credential = PhoneAuthProvider.credential(
          verificationId: args.verificationId, smsCode: pin);
      FirebaseAuth.instance.signInWithCredential(credential).then((result) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (Route<dynamic> route) => false);
      }).catchError((e) {
        showSnackBar(
          context: context,
          text: "Could not log in.",
          type: SnackBarType.error,
        );
      });
    }

    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.deviceHeight! * 3,
                  horizontal: SizeConfig.deviceHeight! * 6),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage("assets/images/grg_logo.png"),
                      width: SizeConfig.deviceWidth! * 30,
                    ),
                    aSizedBox1,
                    AppText(
                      text: "Enter OTP",
                      fontWeight: AppTextWeight.black,
                      fontStyle: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.deviceHeight! * 4),
                    ),
                    aSizedBox1,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text: "Please enter the OTP sent to",
                        fontWeight: AppTextWeight.light,
                        fontStyle: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.deviceHeight! * 2),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text: args.phoneNumber,
                        fontWeight: AppTextWeight.bold,
                        fontStyle: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.deviceHeight! * 2),
                      ),
                    ),
                    aSizedBox1,
                    OTPTextField(
                        controller: otpController,
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                        fieldStyle: FieldStyle.underline,
                        outlineBorderRadius: 15,
                        otpFieldStyle: OtpFieldStyle(
                            enabledBorderColor: AppColors.white,
                            borderColor: AppColors.black,
                            focusBorderColor: AppColors.white),
                        style: TextStyle(fontSize: 17, color: AppColors.white),
                        onChanged: (pin) {},
                        onCompleted: (pin) {
                          onOTPFilled(pin);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class OTPScreenArguments {
  final String phoneNumber;
  final String verificationId;

  OTPScreenArguments({required this.phoneNumber, required this.verificationId});
}
