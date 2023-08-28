import 'package:flutter/material.dart';

class AnimatedScrollViewItem extends StatefulWidget {
  final Widget child;

  const AnimatedScrollViewItem({Key? key, required this.child})
      : super(key: key);

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scaleAnimation,child: widget.child,);
  }
}
