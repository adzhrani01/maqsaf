
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../screens/carts/cubits/carts_cubit/carts_cubit.dart';
import '../../../../screens/carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import '../../../../screens/core/cubits/auth_cubit/auth_cubit.dart';
import '../../../../screens/core/cubits/categories_cubit/categories_cubit.dart';
import '../../../../screens/core/cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../screens/core/cubits/ingredients_cubit/ingredients_cubit.dart';
import '../../../../screens/favorite/cubits/favorite_cubit/favorite_cubit.dart';
import '../../../../screens/favorite/cubits/items_cubit/favorites_cubit.dart';
import '../../../../screens/items/cubits/items_cubit/items_cubit.dart';
import '../../../../screens/orders/cubits/carts_cubit/orders_cubit.dart';
import '../../../../screens/orders/cubits/order_cubit/order_cubit.dart';
import '../../../../screens/profile/cubits/user_cubit/user_cubit.dart';
import '../../../../screens/splash/cubits/splash_cubit/splash_cubit.dart';
import '../../models/drop_item_model.dart';
import 'drop_languages.dart';
import 'locator.dart';

initDataConfiguration() async {
  _initDropLanguages();

}


 initProviders(){

  return [
    /// with get_it
     BlocProvider<SplashCubit>(create: (context) => locator<SplashCubit>()),
    // BlocProvider<UserCubit>(create: (context) => locator<UserCubit>()),
    BlocProvider<AuthCubit>(create: (context) => locator<AuthCubit>()),
    BlocProvider<ChangePasswordCubit>(create: (context) => locator<ChangePasswordCubit>()),
    BlocProvider<UserCubit>(create: (context) => locator<UserCubit>()),
    BlocProvider<CategoriesCubit>(create: (context) => locator<CategoriesCubit>()),
    BlocProvider<IngredientsCubit>(create: (context) => locator<IngredientsCubit>()),
    BlocProvider<ItemsCubit>(create: (context) => locator<ItemsCubit>()),
    BlocProvider<FavoritesCubit>(create: (context) => locator<FavoritesCubit>()),
    BlocProvider<FavoriteCubit>(create: (context) => locator<FavoriteCubit>()),
    BlocProvider<CartsCubit>(create: (context) => locator<CartsCubit>()),
    BlocProvider<ItemCartCubit>(create: (context) => locator<ItemCartCubit>()),
    BlocProvider<OrdersCubit>(create: (context) => locator<OrdersCubit>()),
    BlocProvider<OrderCubit>(create: (context) => locator<OrderCubit>()),



    // /// with out get_it
    // BlocProvider<SplashCubit>(create: (context) => SplashCubit(),),
    // BlocProvider<UserCubit>(create: (context) => UserCubit(authRepository)),
  ];
}

_initDropLanguages() async {
  DropLanguages dropLanguages=DropLanguages.instance;
  // await dropLanguages.loadItemsFromFile( AssetsManager.dropLanguagesJson);
  await dropLanguages.loadItems([
    DropItemModel(name:"en",origin: "en",//image: AssetsManager.ukIcon
    ),
    DropItemModel(name:"ar",origin: "ar",//image: AssetsManager.arIcon
    ),
  ]);
}
