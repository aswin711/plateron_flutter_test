
import 'package:get_it/get_it.dart';
import 'package:plateron_flutter_test_aswin/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/repositories/menu_repository.dart';
import 'package:plateron_flutter_test_aswin/features/menu/domain/usecases/fetch_menu_usecase.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/cart/cart_bloc.dart';
import 'package:plateron_flutter_test_aswin/features/menu/presentation/bloc/menu/menu_bloc.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

    locator.registerSingleton<MenuRepository>(MenuRepositoryImpl());

    locator.registerSingleton<FetchMenuUseCase>(FetchMenuUseCase(locator()));

    locator.registerFactory<MenuBloc>(() => MenuBloc(locator()));

    locator.registerFactory<CartBloc>(() => CartBloc());
}