import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/common/animations/slide_fade_transition.dart';
import 'package:testly/constants/colors.dart';
import 'package:testly/src/widgets/spacing.dart';
import 'package:testly/util.dart';

import 'general_providers.dart';

class AuthWidget extends ConsumerStatefulWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.notSignedInBuilder,
  }) : super(key: key);

  final WidgetBuilder notSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  ConsumerState<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends ConsumerState<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) {
        if (user != null) {
          return widget.signedInBuilder(context);
        }

        return widget.notSignedInBuilder(context);
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: Text("Somethine went wrong"),
      ),
    );
  }
}

class AppDataLoader extends StatefulWidget {
  const AppDataLoader({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDataLoader> createState() => _AppDataLoaderState();
}

class _AppDataLoaderState extends State<AppDataLoader>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AppSlideFadeAnimation(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Initializing...",
              style: TextStyle(
                  color: Colors.amber,
                  fontFamily: "Lato-Bold",
                  fontSize: SizeConfig.deviceHeight! * 4),
            ),
            aSizedBox1,
            SizedBox(
                width: SizeConfig.deviceWidth! * 80,
                height: SizeConfig.deviceHeight! * 1,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(
                    begin: 0,
                    end: 100,
                  ),
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value,
                    color: Colors.white,
                    backgroundColor: Colors.grey,
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
