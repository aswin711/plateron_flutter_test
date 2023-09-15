import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/cart_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_state.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/pages/menu_list_screen.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/app_title_bar.dart';

class PlaceOrderScreen extends StatelessWidget {
  static const String routeName = "/place-order";
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTitleBar(
        title: "Cart",
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          if (state is CartLoaded) {
            CartEntity entity = state.cartEntity!;

            if (entity.products.isEmpty) return const EmptyCart();

            return Column(
              children: [
                ...entity.products
                    .map((e) => CartProductItem(
                          cartProductEntity: e,
                        ))
                    .toList(),
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),),
                      Text("\$${entity.totalAmount}", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),)
                    ],
                  ),
                )
              ],
            );
          }

          return const EmptyCart();
        },
      ),
    );
  }
}

class CartProductItem extends StatelessWidget {
  final CartProductEntity cartProductEntity;
  const CartProductItem({
    super.key,
    required this.cartProductEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(cartProductEntity.name!)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CartButton(
                      menuEntity: MenuEntity(
                          id: cartProductEntity.id,
                          name: cartProductEntity.name,
                          price: cartProductEntity.price)),
                  const SizedBox(height: 15,),
                  Text("\$${cartProductEntity.price}", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  ),)
                ],
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Cart is empty"),
    );
  }
}
