import 'package:flutter/material.dart';
import 'package:testly/src/home/home_screen.dart';
import 'package:testly/src/login/otp_screen.dart';
import 'package:testly/src/search/search_screen..dart';
import 'package:testly/src/test_detail/test_detail_screen.dart';

appRoutes(BuildContext context) {
  return {
    '/otp': (context) => const OtpScreen(),
    '/home': (context) => const HomeScreen(),
    '/search': (context) => const SearchScreen(),
    '/test_detail': (context) => const TestDetailScreen(),
  };
}
