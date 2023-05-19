import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/app_bar/app_bar.dart';
import 'package:testly/common/providers/test/test_provider.dart';
import 'package:testly/common/providers/user/model/user_model.dart';
import 'package:testly/common/providers/user/user_provider.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/constants/strings.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/util.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(testProvider.notifier).getTests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = ref.watch(userProvider).value!;
    return Scaffold(
      appBar: appBar(title: "GRG Healthcare: Home"),
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [HomeTestsListItem()],
      ),
    );
  }
}

class HomeTestsListItem extends StatelessWidget {
  const HomeTestsListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.deviceWidth! * 5,
          vertical: SizeConfig.deviceWidth! * 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  AppImageUrls.bloodTestThumbnailUrl,
                  fit: BoxFit.cover,
                  width: SizeConfig.deviceWidth! * 30,
                  height: SizeConfig.deviceWidth! * 30,
                ),
              ),
              aSizedBox1,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Blood Tests",
                      fontWeight: AppTextWeight.black,
                    ),
                    AppText(
                      text: "(Starting 200)",
                      fontWeight: AppTextWeight.regular,
                      fontStyle:
                          TextStyle(fontSize: SizeConfig.deviceHeight! * 1.4),
                    ),
                    aSizedBox0,
                    AppText(
                      text:
                          "Diagnostic imaging procedure that uses a combination of X-rays and computer  to produce images of the inside of the body.",
                      fontWeight: AppTextWeight.regular,
                      fontStyle: TextStyle(
                          fontSize: SizeConfig.deviceHeight! * 1.6,
                          color: AppColors.grey),
                    ),
                    MaterialButton(
                      color: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      child: AppText(
                        text: "Schedule Now",
                        fontWeight: AppTextWeight.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
