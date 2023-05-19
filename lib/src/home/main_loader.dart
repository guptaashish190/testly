import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/providers/user/user_provider.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/constants/strings.dart';
import 'package:testly/src/home/home_screen.dart';
import 'package:testly/util.dart';

class MainLoader extends ConsumerStatefulWidget {
  const MainLoader({super.key});

  @override
  ConsumerState<MainLoader> createState() => _MainLoaderState();
}

class _MainLoaderState extends ConsumerState<MainLoader> {
  bool loading = true;

  void init() async {
    User? user = FirebaseAuth.instance.currentUser;
    await ref
        .read(userProvider.notifier)
        .updateUserDetails(user!.uid, user.phoneNumber!);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return const HomeScreen();
  }
}
