import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';

class MenuModel extends MenuEntity {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final double? price;
  final MenuTypeModel? menuType;

  const MenuModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.menuType})
      : super(
            id: id,
            name: name,
            image: image,
            description: description,
            price: price,
            menuType: menuType);

  MenuModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        image = json["image"],
        price = json["price"],
        description = json["description"],
        menuType = MenuTypeModel.fromJson(json["type"]);
}

class MenuTypeModel extends MenuTypeEntity {
  final int? id;
  final String? value;

  const MenuTypeModel({this.id, this.value}) : super(id: id, value: value);

  MenuTypeModel.fromJson(Map<String, dynamic> json):
      id = json["id"],
      value = json["value"];
}
