import '../../../domain/entities/menu_entity.dart';

abstract class MenuState {
  final List<MenuEntity> ? menuList;
  final Exception ? exception;
  const MenuState({this.menuList, this.exception});
}

class MenuLoading extends MenuState {
  const MenuLoading(): super();
}

class MenuLoaded extends MenuState {
  const MenuLoaded(List<MenuEntity> menuList): super(menuList: menuList);
}

class MenuFailed extends MenuState {
  const MenuFailed(Exception exception) : super(exception: exception);
}