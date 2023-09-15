import 'dart:async';
import 'dart:io';

import 'package:plateron_flutter_test_aswin/core/resources/data_state.dart';
import 'package:plateron_flutter_test_aswin/features/menu/data/data_sources/local/dummy/menu.dart';
import 'package:plateron_flutter_test_aswin/features/menu/data/models/menu_model.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  @override
  FutureOr<DataState<List<MenuModel>>> fetchMenuList() {
    try {
      List<MenuModel> menuModelList =
          menuJson.map((e) => MenuModel.fromJson(e)).toList();
      return DataSuccess(menuModelList);
    }  catch (err) {
      return DataError(Exception("${err.toString()}\n$err"));
    }
  }
}
