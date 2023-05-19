import 'package:flutter/material.dart';

class AppSlideFadeAnimation extends StatefulWidget {
  const AppSlideFadeAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<AppSlideFadeAnimation> createState() => _AppSlideFadeAnimationState();
}

class _AppSlideFadeAnimationState extends State<AppSlideFadeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: const Offset(0.2, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
