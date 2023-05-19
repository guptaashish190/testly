import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testly/common/app_bar/app_bar.dart';
import 'package:testly/common/providers/test/model/test_model.dart';
import 'package:testly/constants/buttons.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/constants/strings.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/src/widgets/text_inputs.dart';
import 'package:testly/util.dart';

class TestDetailScreen extends StatelessWidget {
  const TestDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TestDetailScreenArguments;

    return Scaffold(
      appBar: appBar(title: "TEST"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.deviceWidth! * 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppText(
                  text: args.test.name,
                  fontWeight: AppTextWeight.black,
                  fontStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: SizeConfig.deviceHeight! * 2.5,
                  ),
                ),
              ),
              aSizedBox1,
              AppText(
                text: AppStrings.bloodTestDescription,
                fontWeight: AppTextWeight.light,
                fontStyle: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: SizeConfig.deviceHeight! * 1.9,
                ),
              ),

              aSizedBox3,

              // Select Patient

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: AppText(
                  text: "Select Patient",
                  fontWeight: AppTextWeight.bold,
                ),
              ),
              aSizedBox0,
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PatientDetailDialog();
                      });
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(SizeConfig.deviceWidth! * 3),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.6),
                            spreadRadius: 0.1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primary,
                        )),
                    child: AppText(text: "Ashish Gupta 24/M")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestDetailScreenArguments {
  final TestModel test;

  TestDetailScreenArguments({required this.test});
}

class PatientDetailDialog extends StatefulWidget {
  @override
  _PatientDetailDialogState createState() => _PatientDetailDialogState();
}

class _PatientDetailDialogState extends State<PatientDetailDialog> {
  TextEditingController usernameTEC = TextEditingController();
  TextEditingController ageTEC = TextEditingController();
  String sex = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppText(text: 'Add Patient'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BasicTextField(
              textController: usernameTEC,
              hintText: "Patient Name",
            ),
            aSizedBox0,
            BasicTextField(
              textController: ageTEC,
              keyboardType: TextInputType.number,
              hintText: "Age",
            ),
            aSizedBox0,
            ListTile(
              title: Text('Male'),
              leading: Radio(
                value: 'Male',
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Female'),
              leading: Radio(
                value: 'Female',
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppGradientButton(
          color1: Color(0xff11998e),
          color2: Color(0xff38ef7d),
          text: 'Submit',
        )
      ],
    );
  }
}
