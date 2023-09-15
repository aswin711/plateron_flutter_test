import 'package:flutter/material.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/white_box.dart';

class CartActionButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const CartActionButton({
    super.key, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteBox(child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Icon(icon),
    ),);
  }
}



class CartIncrementButton extends StatelessWidget {
  final Function()? onPressed;
  const CartIncrementButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CartActionButton(icon: Icons.add, onPressed: onPressed);
  }
}

class CartDecrementButton extends StatelessWidget {
  final Function()? onPressed;
  const CartDecrementButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CartActionButton(icon: Icons.remove, onPressed: onPressed);
  }
}


