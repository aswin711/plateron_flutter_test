import 'dart:async';

import 'package:plateron_flutter_test_aswin/core/resources/data_state.dart';
import 'package:plateron_flutter_test_aswin/core/usecases/usecase.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/repositories/menu_repository.dart';

class FetchMenuUseCase extends UseCase<DataState<List<MenuEntity>>, void> {

  final MenuRepository _menuRepository;

  FetchMenuUseCase(this._menuRepository);

  @override
  FutureOr<DataState<List<MenuEntity>>> call({void params}) async {
    return _menuRepository.fetchMenuList();
  }

}