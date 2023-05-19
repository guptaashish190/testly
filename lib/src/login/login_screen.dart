import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/constants/snackbar.dart';
import 'package:testly/constants/strings.dart';
import 'package:testly/src/login/otp_screen.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/src/widgets/text_inputs.dart';
import 'package:testly/util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onGetOTPClick() {
      final String phone = "+91" + phoneNumberController.text;
      FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (phoneCredential) {
            FirebaseAuth.instance
                .signInWithCredential(phoneCredential)
                .then((result) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (Route<dynamic> route) => false);
            }).catchError((e) {
              showSnackBar(
                context: context,
                text: "Could not log in.",
                type: SnackBarType.error,
              );
            });
          },
          verificationFailed: (firebaseAuthException) {
            showSnackBar(
                context: context,
                text: "Authentication Failed",
                type: SnackBarType.error);
          },
          codeSent: (verificationID, resendInt) {
            Navigator.pushNamed(context, '/otp',
                arguments: OTPScreenArguments(
                    phoneNumber: phone, verificationId: verificationID));
          },
          codeAutoRetrievalTimeout: (verificationID) {
            showSnackBar(
                context: context,
                text: "Verification timed out",
                type: SnackBarType.warning);
          });
    }

    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
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
                        const AppText(
                          text: "Welcome to",
                          fontStyle: TextStyle(color: Colors.white),
                        ),
                        aSizedBox0,
                        AppText(
                          text: AppStrings.homeTitle,
                          fontWeight: AppTextWeight.black,
                          fontStyle: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.deviceHeight! * 4),
                        ),
                        aSizedBox1,
                        AppText(
                          text: AppStrings.homeTitleDescriiption,
                          fontWeight: AppTextWeight.light,
                          fontStyle: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.deviceHeight! * 2),
                        ),
                        aSizedBox1,
                        BasicTextField(
                          textController: phoneNumberController,
                          hintText: "Enter your phone number",
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: AppColors.white,
                  onPressed: () {
                    onGetOTPClick();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 19.0),
                    child: AppText(
                      text: "Get OTP",
                      fontWeight: AppTextWeight.bold,
                      fontStyle:
                          TextStyle(fontSize: SizeConfig.deviceHeight! * 2.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
