import 'package:equatable/equatable.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';

class CartEntity extends Equatable {

  List<CartProductEntity> products = [];

  CartEntity();

  CartEntity remove(int id) {
    int index = products.indexWhere((element) => element.id == id);
    if (index > -1) {
      int quantity = products[index].quantity;
      if (quantity == 1) {
        products.removeWhere((element) => element.id == id);
      } else {
        products[index].quantity--;
      }
    }

    return this;
  }

  CartEntity add(MenuEntity menuEntity) {
    int index = products.indexWhere((element) => element.id == menuEntity.id);

    if (index > -1) {
      products[index].quantity++;
    } else {
      products.add(CartProductEntity(menuEntity.id, menuEntity.price, menuEntity.name));
    }

    return this;
  }

  int getProductQuantity(int id) {
    int index = products.indexWhere((element) => element.id == id);
    if (index == -1) return 0;
    return products[index].quantity;
  }

  double get totalAmount {
    return products.fold(0, (previousValue, element) => previousValue + (element.price! * element.quantity));
  }

  @override
  List<Object?> get props => [...products];

  CartEntity copyWith({ List<CartProductEntity> ? products}) {
    return CartEntity()..products = products ?? this.products;
  }

}

class CartProductEntity extends Equatable {

  final int ? id;
  final double ? price;
  final String ? name;
  int quantity = 1;

  CartProductEntity(this.id, this.price, this.name);

  @override
  List<Object?> get props => [id];

}