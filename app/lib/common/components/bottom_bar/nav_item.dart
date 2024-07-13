import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: 27.0,
          color: selected ? Colors.white : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }
}
