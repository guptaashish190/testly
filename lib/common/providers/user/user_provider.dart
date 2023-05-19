import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/providers/user/model/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, AsyncValue<UserModel>>(
    (ref) => UserNotifier());

class UserNotifier extends StateNotifier<AsyncValue<UserModel>> {
  UserNotifier() : super(const AsyncValue.loading());

  void addNewUser(userId, phoneNumber) async {}

  Future<UserModel> updateUserDetails(String userId, String phoneNumber) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection("users").doc(userId);

    DocumentSnapshot userData = await user.get();

    if (!userData.exists) {
      print("new user");
      Map<String, dynamic> newUser = {
        "userId": userId,
        "phoneNumber": phoneNumber,
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .set(newUser);

      state = AsyncData(UserModel.fromJson(newUser));

      return UserModel.fromJson(newUser);
    } else {
      DocumentSnapshot userDoc = await user.get();
      Map<String, dynamic> userJson = userDoc.data() as Map<String, dynamic>;
      state = AsyncData(UserModel.fromJson(userJson));
      print("User updated");

      return UserModel.fromJson(userJson);
    }
    ;
  }
}
