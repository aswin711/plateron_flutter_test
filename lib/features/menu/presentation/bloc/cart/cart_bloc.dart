import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/cart_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_event.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc(): super(CartInitialised()) {
    on<FetchCart> (_fetchCart);
    on<AddToCart> (_addToCart);
    on<RemoveFromCart> (_removeFromCart);
  }

  void _fetchCart(FetchCart event, Emitter<CartState> emit) {
    emit(CartLoaded(state.cartEntity!));
  }

  void _addToCart(AddToCart event, Emitter<CartState> emit) {

    emit(CartLoaded(state.cartEntity!.add(event.menuEntity!)));
  }

  void _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    state.cartEntity?.remove(event.productId!);
    emit(CartLoaded(state.cartEntity!));
  }
}