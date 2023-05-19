import 'package:flutter/material.dart';

class AppSlideDownAnimation extends StatefulWidget {
  const AppSlideDownAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<AppSlideDownAnimation> createState() => _AppSlideDownAnimationState();
}

class _AppSlideDownAnimationState extends State<AppSlideDownAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: const Offset(0, -0.2),
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
