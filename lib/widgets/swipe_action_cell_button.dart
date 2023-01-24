import 'package:flutter/material.dart';

class SwipeActionCellButton extends StatelessWidget {
  final Color color;
  final IconData icon;

  const SwipeActionCellButton({required this.color, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
