import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final bool isBookmarked;
  final VoidCallback onBtnPressed;

  const HeartButton(
      {Key? key, required this.isBookmarked, required this.onBtnPressed})
      : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onBtnPressed();
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.3, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: widget.isBookmarked
            ? const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
                size: 30,
              ),
      ),
    );
  }
}
