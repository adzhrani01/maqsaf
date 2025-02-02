import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/screens/core/cubits/categories_cubit/categories_cubit.dart';
import 'package:maqsaf_app/screens/details_order_screen.dart';
import 'package:maqsaf_app/screens/items/cubits/items_cubit/items_cubit.dart';
import 'package:maqsaf_app/screens/shopping_screen.dart';

import '../../core/helpers/operation_file.dart';
import '../../core/widgets/image/image_food.dart';
import '../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import '../carts/data/models/cart_model.dart';
import '../carts/data/models/item_cart_model.dart';
import '../favorite/cubits/favorite_cubit/favorite_cubit.dart';
import '../favorite/cubits/favorites_cubit/favorites_cubit.dart';
import '../profile/cubits/user_cubit/user_cubit.dart';
import 'data/models/food_model.dart';

class OnlineOrderScreen extends StatefulWidget {
  const OnlineOrderScreen({super.key});

  @override
  State<OnlineOrderScreen> createState() => _OnlineOrderScreenState();
}

class _OnlineOrderScreenState extends State<OnlineOrderScreen> {
  int? selectedCategoryIndex ;
  // int selectedCategoryIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<String> foodCategories = [
    'الوجبات الرئيسية',
    'المشروبات',
    'الحلويات',
    'المقبلات',
    'السندويشات',
    'العصائر',
  ];

  @override
  void initState() {
    context.read<CategoriesCubit>().init(context);
    context.read<ItemsCubit>().init(context);
    context.read<FavoritesCubit>().init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            height: height,
            decoration: BoxDecoration(
                gradient:

                AppColor.myGradient),
            // decoration: linearGradientDecoration(),
            child: Column(
              children: [
                _buildAppBar(width),

                Expanded(
                  child:


                  BlocBuilder<ItemsCubit,ItemsState>(
                    buildWhen: (previous, current)=>context.read<ItemsCubit>().buildItemsWhen(previous, current),
                    builder: (context, state)=>
                    context.read<ItemsCubit>().buildItems(context, state,
                        _buildFoodList(width
                        ,context.read<ItemsCubit>().itemsByFilter

                    ))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(double width) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              right: 16,
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildIconButton(
                        Icons.arrow_back, () => Navigator.pop(context)),
                    const SizedBox(width: 16),
                    Text(
                      'اطلب مسبقاً',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildIconButton(Icons.shopping_cart, () {
                  navigationPush(context, const CartScreen());
                }),
              ],
            ),
          ),

          SizedBox(height: 22),
          BlocBuilder<CategoriesCubit,CategoriesState>(
          buildWhen: (previous, current)=>context.read<CategoriesCubit>().buildCategoriesWhen(previous, current),
          builder: (context, state)=>
          context.read<CategoriesCubit>().buildItems(context, state,
          Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<CategoriesCubit>().categories.length,
              // itemCount: foodCategories.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final item=context.read<CategoriesCubit>().categories[index];
                final isSelected = selectedCategoryIndex == index;
                return GestureDetector(
                  onTap: () {
                    context.read<ItemsCubit>().changeIndex(item.id);
                    setState(() => selectedCategoryIndex = index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      item.name??'--',
                      // foodCategories[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            )
          ))
            ,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  Widget _buildFoodList(double width,List<FoodModel> items) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                navigationPush(context,  DetailsOrderScreen(item: items[index],));
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageFood(
                      url:getStorageUrl(items[index].image),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      foregroundColor:Colors.grey.shade400 ,
                      backgroundColor:Colors.grey.shade200 ,

                    )
                    // ImageFood(
                    //   url:getStorageUrl( "/media/items/313896434_457413909827066_6132971359909707631_n.jpg"??items[index].image),
                    //   width: 100,
                    //   height: 100,
                    //   errorBuilder: Container(
                    //     width: 100,
                    //     height: 100,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey.shade200,
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //     child: Icon(Icons.fastfood,
                    //         color: Colors.grey.shade400, size: 40),
                    //   ),
                    // )
                   ,
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[index].name??
                                'وجبة ${index + 1}',
                                style: TextStyle(
                                  fontSize: width * 0.040,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      BlocBuilder<FavoritesCubit,FavoritesState>(
                        buildWhen: (previous, current)=>context.read<FavoritesCubit>().buildItemsWhen(previous, current),
                        builder: (context, state)=>

                            state.maybeWhen(
                                loading:()=>const LoadingDataView(),
                                failure: (networkExceptions)=>IconButton(
                                  icon: const Icon(Icons.refresh),
                                  onPressed: () {
                                    context.read<FavoritesCubit>().onRefresh(context);
                                  },
                                ),
                                orElse: () {
                                  bool isFavorite=context.read<FavoritesCubit>().checkFavourite(context,itemId:items[index].id);
                                  return   IconButton(
                                    icon:  Icon(
                                        isFavorite?
                                        Icons.favorite
                                            : Icons.favorite_border
                                    ),
                                    color: Colors.red,
                                    onPressed: () async {

                                     await context.read<FavoriteCubit>().changeItemFavourite(context,itemId:items[index].id
                                          ,favorite:isFavorite
                                          ,onSuccess: ()=>
                                          !isFavorite?
                                              context.read<FavoritesCubit>().addFavourite(context,itemId:items[index].id )
                                              :context.read<FavoritesCubit>().removeFavourite(context,itemId:items[index].id )
                                      );

                                    },
                                  );
                                }

                            )


                      ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                size: width * 0.04,
                              ),
                              Text(
                                '${items[index].calories??'--'}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: width * 0.035,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(

                                '${ items[index].price??'--'} ريال',
                                // '${10 + index} ريال',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2D91C0),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {

                                  context.read<ItemCartCubit>().cartModel?.addToCart(ItemCartModel(
                                      id: items[index].id,
                                      item: items[index],
                                      quantity: 1,
                                      itemId:items[index]?.id,
                                      deliveryDate: DateTime.now(),
                                      notes: "",
                                      extras: []
                                  ));

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(24),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  decoration: BoxDecoration(
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.1),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        AppColor.primaryColor,
                                                    size: width * 0.15,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  'تمت الإضافة بنجاح',
                                                  style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                  'تم إضافة المنتج إلى سلة المشتريات',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                const SizedBox(height: 24),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        style: TextButton
                                                            .styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 12),
                                                        ),
                                                        child: Text(
                                                          'متابعة التسوق',
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: Colors
                                                                .grey[600],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          navigationPush(
                                                              context,
                                                              const CartScreen());
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColor
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 12),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'الذهاب للسلة',
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'أضف للسلة',
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
