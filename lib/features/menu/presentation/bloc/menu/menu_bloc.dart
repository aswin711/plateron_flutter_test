import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plateron_flutter_test_aswin/core/resources/data_state.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/entities/menu_entity.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_event.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_state.dart';

import '../../../domain/usecases/fetch_menu_usecase.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {

  final FetchMenuUseCase _fetchMenuUseCase;

  MenuBloc(this._fetchMenuUseCase) : super(const MenuLoading()) {
    on<FetchMenu>(_fetchMenu);
  }

  void _fetchMenu(FetchMenu event, Emitter<MenuState> emit) async {

    DataState<List<MenuEntity>> result = await _fetchMenuUseCase();

    if (result is DataSuccess) {
      emit(MenuLoaded(result.data!));
    } else if (result is DataError) {
      emit(MenuFailed(result.error!));
    }
  }

}