import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maqsaf_app/screens/carts/cubits/carts_cubit/carts_cubit.dart';
import 'package:maqsaf_app/screens/carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import 'package:maqsaf_app/screens/carts/data/datasource/remote/carts_remote_data_source.dart';
import 'package:maqsaf_app/screens/carts/data/models/item_cart_model.dart';
import 'package:maqsaf_app/screens/carts/domain/repositories/carts_repository.dart';
import 'package:maqsaf_app/screens/core/cubits/categories_cubit/categories_cubit.dart';
import 'package:maqsaf_app/screens/core/cubits/ingredients_cubit/ingredients_cubit.dart';
import 'package:maqsaf_app/screens/core/data/datasource/remote/categories_remote_data_source.dart';
import 'package:maqsaf_app/screens/core/data/datasource/remote/ingredients_remote_data_source.dart';
import 'package:maqsaf_app/screens/core/domain/repositories/categories_repository.dart';
import 'package:maqsaf_app/screens/core/domain/repositories/ingredients_repository.dart';
import 'package:maqsaf_app/screens/favorite/cubits/favorite_cubit/favorite_cubit.dart';

import 'package:maqsaf_app/screens/favorite/data/datasource/remote/favorites_remote_data_source.dart';
import 'package:maqsaf_app/screens/favorite/domain/repositories/favorites_repository.dart';
import 'package:maqsaf_app/screens/items/cubits/items_cubit/items_cubit.dart';
import 'package:maqsaf_app/screens/items/data/datasource/remote/items_remote_data_source.dart';
import 'package:maqsaf_app/screens/items/domain/repositories/items_repository.dart';
import 'package:maqsaf_app/screens/notification/data/datasource/remote/Notification_remote_data_source.dart';
import 'package:maqsaf_app/screens/orders/cubits/order_cubit/order_cubit.dart';
import 'package:maqsaf_app/screens/orders/data/datasource/remote/orders_remote_data_source.dart';
import 'package:maqsaf_app/screens/orders/domain/repositories/orders_repository.dart';
import 'package:maqsaf_app/screens/payment_carts/cubits/payment_carts_cubit/payment_carts_cubit.dart';
import 'package:maqsaf_app/screens/payment_carts/data/datasource/remote/payment_carts_remote_data_source.dart';
import 'package:maqsaf_app/screens/payment_carts/domain/repositories/payment_carts_repository.dart';

import '../../../../screens/core/cubits/auth_cubit/auth_cubit.dart';
import '../../../../screens/core/cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../screens/favorite/cubits/favorites_cubit/favorites_cubit.dart';
import '../../../../screens/login/data/remote/auth_remote_data_source.dart';
import '../../../../screens/login/domain/repositories/auth_repository.dart';
import '../../../../screens/notification/cubits/notifications_cubit/notifications_cubit.dart';
import '../../../../screens/notification/domain/repositories/notification_repository.dart';
import '../../../../screens/orders/cubits/carts_cubit/orders_cubit.dart';
import '../../../../screens/payment_carts/cubits/payment_cart_cubit/payment_cart_cubit.dart';
import '../../../../screens/profile/cubits/user_cubit/user_cubit.dart';
import '../../../../screens/profile/data/remote/user_remote_data_source.dart';
import '../../../../screens/profile/domain/repositories/user_repository.dart';
import '../../../../screens/splash/cubits/splash_cubit/splash_cubit.dart';
import '../../../domain/services/api_service.dart';
import '../../../domain/services/api_services_imp.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiServices>(() => ApiServicesImp(locator()));
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(AuthRemoteDataSource(locator())));
  locator.registerLazySingleton<UserRepository>(() => UserRepository(UserRemoteDataSource(locator())));
  locator.registerLazySingleton<CategoriesRepository>(() => CategoriesRepository(CategoriesRemoteDataSource(locator())));
  locator.registerLazySingleton<IngredientsRepository>(() => IngredientsRepository(IngredientsRemoteDataSource(locator())));
  locator.registerLazySingleton<ItemsRepository>(() => ItemsRepository(ItemsRemoteDataSource(locator())));
  locator.registerLazySingleton<FavoritesRepository>(() => FavoritesRepository(FavoritesRemoteDataSource(locator())));
  locator.registerLazySingleton<CartsRepository>(() => CartsRepository(CartsRemoteDataSource(locator())));
  locator.registerLazySingleton<OrdersRepository>(() => OrdersRepository(OrdersRemoteDataSource(locator())));
  locator.registerLazySingleton<PaymentCartsRepository>(() => PaymentCartsRepository(PaymentCartsRemoteDataSource(locator())));
  locator.registerLazySingleton<NotificationRepository>(() => NotificationRepository(NotificationRemoteDataSource(locator())));


  // Registering the cubits
  locator.registerFactory<SplashCubit>(() => SplashCubit());
  // locator.registerFactory<UserCubit>(() => UserCubit(locator<AuthRepository>()));
  locator.registerFactory<AuthCubit>(() => AuthCubit(locator<AuthRepository>()));
  locator.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(locator<AuthRepository>()));
  locator.registerFactory<UserCubit>(() => UserCubit(locator<UserRepository>()));
  locator.registerFactory<CategoriesCubit>(() => CategoriesCubit(locator<CategoriesRepository>()));
  locator.registerFactory<IngredientsCubit>(() => IngredientsCubit(locator<IngredientsRepository>()));
  locator.registerFactory<ItemsCubit>(() => ItemsCubit(locator<ItemsRepository>()));
  locator.registerFactory<FavoritesCubit>(() => FavoritesCubit(locator<FavoritesRepository>()));
  locator.registerFactory<FavoriteCubit>(() => FavoriteCubit(locator<FavoritesRepository>()));
  locator.registerFactory<CartsCubit>(() => CartsCubit(locator<CartsRepository>()));
  locator.registerFactory<ItemCartCubit>(() => ItemCartCubit(locator<CartsRepository>()));
  locator.registerFactory<OrdersCubit>(() => OrdersCubit(locator<OrdersRepository>()));
  locator.registerFactory<OrderCubit>(() => OrderCubit(locator<OrdersRepository>()));
  locator.registerFactory<PaymentCartsCubit>(() => PaymentCartsCubit(locator<PaymentCartsRepository>()));
  locator.registerFactory<PaymentCartCubit>(() => PaymentCartCubit(locator<PaymentCartsRepository>()));
  locator.registerFactory<NotificationsCubit>(() => NotificationsCubit(locator<NotificationRepository>()));

}