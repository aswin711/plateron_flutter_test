import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/cart_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_event.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_state.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_state.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/pages/place_order_screen.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/app_button.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/cart_action_button.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/widgets/cart_counter.dart';

import '../widgets/app_title_bar.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTitleBar(
        title: "Salads and Soups",
      ),
      bottomSheet: CartBottomSheet(),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is MenuLoaded) {
            return ListView.separated(
                itemBuilder: (context, index) => MenuItem(
                      menuEntity: state.menuList![index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                      child: Divider(),
                    ),
                itemCount: state.menuList!.length);
          } else if (state is MenuFailed) {
            return Center(
              child: Text(state.exception.toString()),
            );
          }

          return Container();
        },
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final MenuEntity menuEntity;
  const MenuItem({
    super.key,
    required this.menuEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 150,
            height: 120,
            child: Image.network(
              menuEntity.image!,
              fit: BoxFit.cover,
            )),
        Expanded(
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Text(
                      menuEntity.name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      menuEntity.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("\$${menuEntity.price}"),  CartButton(menuEntity: menuEntity,)],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  final MenuEntity menuEntity;
  const CartButton({
    super.key,
    required this.menuEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
       if (state is CartLoaded) {
        final cartEntity = state.cartEntity!;
        int quantity = cartEntity.getProductQuantity(menuEntity.id!);
        if (quantity == 0) {
          return AddToCartButton(
            menuEntity: menuEntity,
          );
        } else {
          return SizedBox(
            width: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CartDecrementButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(RemoveFromCart(menuEntity.id!));
                  },
                ),
                CartCounter(count: quantity),
                CartIncrementButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddToCart(menuEntity));
                  },
                )
              ],
            ),
          );
        }
      } else {
         return AddToCartButton(menuEntity: menuEntity,);
       }
    });
  }
}

class AddToCartButton extends StatelessWidget {
  final MenuEntity menuEntity;
  const AddToCartButton({
    super.key,
    required this.menuEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
        onPressed: () {
          context.read<CartBloc>().add(
              AddToCart(menuEntity));
        },
        title: "Add");
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            CartEntity cartEntity = state.cartEntity!;

            if (cartEntity.products.isEmpty) return const SizedBox.shrink();

            return PhysicalModel(
              color: Colors.white,
              elevation: 1.0,
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shopping_cart),
                        const SizedBox(width: 5,),
                        Text("${cartEntity.products.length} Items")
                      ],
                    ),
                    AppButton(title: "Place Order", width: 150, onPressed: () {
                      Navigator.of(context).pushNamed(PlaceOrderScreen.routeName);
                    },)
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }
    );
  }
}
