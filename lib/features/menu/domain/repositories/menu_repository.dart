import 'dart:async';

import 'package:plateron_flutter_test_aswin/core/resources/data_state.dart';

import '../entities/menu_entity.dart';

abstract class MenuRepository {

  FutureOr<DataState<List<MenuEntity>>> fetchMenuList();

}