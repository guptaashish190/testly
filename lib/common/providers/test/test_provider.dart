import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/providers/test/model/test_model.dart';
import 'package:testly/common/providers/user/model/user_model.dart';

const TESTS_FETCH_LIMIT = 5;

final testProvider =
    StateNotifierProvider<TestProvider, AsyncValue<List<TestModel>>>(
        (ref) => TestProvider());

class TestProvider extends StateNotifier<AsyncValue<List<TestModel>>> {
  TestProvider() : super(const AsyncValue.loading());

  void getTests() async {
    if (!state.hasValue) return;
    QuerySnapshot tests =
        await FirebaseFirestore.instance.collection("tests").get();

    final testsData = tests.docs;

    state = AsyncData(testsData.map((element) {
      return TestModel.fromJson(element.data() as Map<String, dynamic>);
    }).toList());
  }

  Future<List<TestModel>> findTests(String query) async {
    QuerySnapshot tests = await FirebaseFirestore.instance
        .collection("tests")
        .where("name", isGreaterThanOrEqualTo: query)
        .where("name", isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    print("TESTS kength " + tests.size.toString());
    return tests.docs.map((e) {
      return TestModel.fromJson(e.data() as Map<String, dynamic>);
    }).toList();
  }
}
