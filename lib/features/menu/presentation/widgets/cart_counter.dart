import 'package:flutter/material.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/white_box.dart';

class CartCounter extends StatelessWidget {
  final int count;
  const CartCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return WhiteBox(child: Text(count.toString(), style: Theme.of(context).textTheme.headlineSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700
    ),));
  }
}
