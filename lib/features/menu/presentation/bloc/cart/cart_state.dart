import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/cart_entity.dart';

abstract class CartState {
  CartEntity ? cartEntity;
  final Exception ?  exception;
  CartState({this.cartEntity, this.exception});
}

class CartInitialised extends CartState {
   CartInitialised() : super(cartEntity: CartEntity());
}

class CartLoading extends CartState {
  CartLoading() : super();
}

class CartLoaded extends CartState {
  CartLoaded(CartEntity cartEntity): super(cartEntity: cartEntity);
}

class CartError extends CartState {
  CartError(Exception exception) : super(exception: exception);
}

