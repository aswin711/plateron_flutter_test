import 'package:equatable/equatable.dart';

class MenuEntity extends Equatable {
  final int ? id;
  final String ? name;
  final String ? image;
  final String ? description;
  final double ? price;
  final MenuTypeEntity ? menuType;

  const MenuEntity(
      {
        this.id,
        this.name,
        this.image,
        this.description,
        this.price,
        this.menuType
      });

  @override
  List<Object?> get props => [id];
}

class MenuTypeEntity extends Equatable {
  final int ? id;
  final String ? value;

  const MenuTypeEntity({this.id, this.value});

  @override
  List<Object?> get props => [id];
}
