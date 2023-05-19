import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/app_bar/app_bar.dart';
import 'package:testly/common/providers/test/model/test_model.dart';
import 'package:testly/common/providers/test/test_provider.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/src/test_detail/test_detail_screen.dart';
import 'package:testly/src/widgets/app_text.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/src/widgets/text_inputs.dart';
import 'package:testly/util.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController searchController;
  List<TestModel> testsList = [];
  String queryString = "";

  @override
  void initState() {
    searchController = TextEditingController();
    ref.read(testProvider.notifier).getTests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tests = ref.watch(testProvider);

    return Scaffold(
        appBar: appBar(title: "Search"),
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.deviceWidth! * 7),
          child: Column(
            children: [
              aSizedBox1,
              BasicTextField(
                onChanged: (query) {
                  if (!tests.hasValue) return;
                  setState(() {
                    testsList = tests.asData!.value
                        .where((element) => element.name.contains(query))
                        .toList();
                  });
                },
                textController: searchController,
                hintText: "Search",
                icon: Icons.search,
              ),
              tests.map(data: (data) {
                List<TestModel> testsList = data.asData!.value
                    .where((element) => element.name
                        .toUpperCase()
                        .contains(searchController.text.toUpperCase()))
                    .toList();

                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          testsList.map((e) => SearchItem(test: e)).toList(),
                    ),
                  ),
                );
              }, error: (e) {
                return const Text("Error occured");
              }, loading: (_) {
                return const CircularProgressIndicator();
              }),
            ],
          ),
        )));
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.test,
  });

  final TestModel test;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/test_detail',
            arguments: TestDetailScreenArguments(test: test));
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.deviceHeight! * 1.5),
        margin: EdgeInsets.symmetric(vertical: SizeConfig.deviceHeight! * 0.5),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primary.withOpacity(0.5),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(7)),
        child: Row(
          children: [
            Expanded(
              child: AppText(
                text: test.name.toUpperCase(),
                fontWeight: AppTextWeight.bold,
                fontStyle: TextStyle(fontSize: 12),
              ),
            ),
            Row(
              children: [
                AppText(
                  text: "₹${test.mrp.toString().toUpperCase()}",
                  fontWeight: AppTextWeight.bold,
                  fontStyle: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                      color: AppColors.grey),
                ),
                aSizedBox0,
                AppText(
                  text: "₹" + test.price.toString().toUpperCase(),
                  fontWeight: AppTextWeight.bold,
                  fontStyle:
                      const TextStyle(fontSize: 12, color: AppColors.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
