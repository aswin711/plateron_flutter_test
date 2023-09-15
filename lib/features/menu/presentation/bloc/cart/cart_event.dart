import 'package:equatable/equatable.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/cart_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';

abstract class CartEvent extends Equatable {

  final int ? productId;
  final MenuEntity ? menuEntity;

  const CartEvent({this.menuEntity, this.productId});

  @override
  List<Object> get props => [productId!];
}

class FetchCart extends CartEvent {
  const FetchCart(): super();
}

class AddToCart extends CartEvent {
  const AddToCart(MenuEntity menuEntity): super(menuEntity:  menuEntity);
}

class RemoveFromCart extends CartEvent {
  const RemoveFromCart(int productId): super(productId: productId);
}