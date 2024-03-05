import 'package:get_it/get_it.dart';
import 'package:ready_structure/core/networking/net/dio/dio_provider.dart';
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';
import 'package:ready_structure/features/auth/data/data_source/auth_rds_impl.dart';
import 'package:ready_structure/features/auth/data/repository/auth_repo_impl.dart';
import 'package:ready_structure/features/auth/domain/usecases/auth_usecases.dart';
import 'package:ready_structure/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ready_structure/features/products/data/data_source/product_rds_impl.dart';
import 'package:ready_structure/features/products/data/repository/product_repo_impl.dart';
import 'package:ready_structure/features/products/domain/usecases/product_usecases.dart';
import 'package:ready_structure/features/products/presentation/cubit/product_cubit.dart';

import '../services/navigation.dart';
import '../shared_prefs/app_shared_prefs.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs());
  locator.registerLazySingleton<ApplicationCubit>(() => ApplicationCubit());
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit(
      useCase:
          AuthUseCase(repository: AuthRepositoryImpl(rdsImpl: AuthRDSImpl()))));
  locator.registerLazySingleton<ProductCubit>(() => ProductCubit(
      useCase: ProductUseCase(
          repository: ProductRepoImpl(
              rdsImpl: ProductRDSImpl(dioProvider: const DioProvider())))));
}
