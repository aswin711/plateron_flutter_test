import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_flutter_test_aswin/config/theme/theme.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_event.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/pages/menu_list_screen.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/pages/place_order_screen.dart';
import 'package:plateron_flutter_test_aswin/injection_container.dart';

import 'features/menu/presentation/bloc/menu/menu_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(create: (c) => locator()..add(const FetchMenu())),
        BlocProvider<CartBloc>(create: (c) => locator())
      ],
      child: MaterialApp(
        title: 'Flutter Menu Cart',
        theme: appTheme,
        home: const MenuListScreen(),
        routes: {
          PlaceOrderScreen.routeName: (context) => const PlaceOrderScreen()
        },
      ),
    );
  }
}
