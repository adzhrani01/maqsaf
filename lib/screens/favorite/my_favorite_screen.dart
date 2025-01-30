import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/screens/details_order_screen.dart';
import 'package:maqsaf_app/screens/favorite/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:maqsaf_app/screens/items/cubits/items_cubit/items_cubit.dart';
import 'package:maqsaf_app/screens/shopping_screen.dart';
import '../../constants/assets_path.dart';
import '../../core/helpers/operation_file.dart';
import '../../core/widgets/image/image_food.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import '../carts/data/models/item_cart_model.dart';
import '../items/data/models/food_model.dart';
import 'cubits/favorites_cubit/favorites_cubit.dart';
import 'data/models/favorite_model.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<FavoritesCubit>().init(context);
    context.read<ItemsCubit>().init(context);
    super.initState();
  }
  List<FoodModel> getFilteredFoods() {


    return context.read<ItemsCubit>().items.where((food) {

      bool matchesFilters =
      (context.read<FavoritesCubit>().items )
          .any((item) => food.id==item.itemId);
      return matchesFilters;
    }).toList();
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
            decoration: linearGradientDecoration(),
            child: Column(
              children: [
                _buildAppBar(width),
                Expanded(
                  child:
    BlocBuilder<FavoritesCubit,FavoritesState>(
    buildWhen: (previous, current)=>context.read<FavoritesCubit>().buildItemsWhen(previous, current),
    builder: (context, state)=>
    context.read<FavoritesCubit>().buildItems(context, state,
    BlocBuilder<ItemsCubit,ItemsState>(
    buildWhen: (previous, current)=>context.read<ItemsCubit>().buildItemsWhen(previous, current),
    builder: (context, state)=>
    context.read<ItemsCubit>().buildItems(context, state,
                  _buildFavoritesList(width,getFilteredFoods()))))),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildIconButton(
                    Icons.arrow_back, () => Navigator.pop(context)),
                const SizedBox(width: 16),
                Text(
                  'الوجبات المفضلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            _buildIconButton(Icons.shopping_cart_outlined, () {
              navigationPush(context, const CartScreen());

            }),
          ],
        ),
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

  Widget _buildFavoritesList(double width,List<FoodModel> items) {
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
              onTap: ()   =>navigationPush(context,  DetailsOrderScreen(item: items[index],)),
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

                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(15),
                    //   child: Image.asset(
                    //     AssetsPath.food,
                    //     width: 100,
                    //     height: 100,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].name??
                                    'وجبة ${ items[index].id}',
                                    style: TextStyle(
                                      fontSize: width * 0.040,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    items[index].description??
                                    'وصف الوجبة ${index + 1}',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: width * 0.035,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
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

                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite),
                                color: Colors.red,
                                onPressed: () {

                                  context.read<FavoriteCubit>().changeItemFavourite(context,itemId:items[index].id
                                  ,favorite:true
                                      ,onSuccess: ()=>
                                      context.read<FavoritesCubit>().onRefresh(context));

                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${items[index].price??'--'} ريال',
                                // '${10 + index} ريال',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2D91C0),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      context.read<ItemCartCubit>().cartModel?.addToCart(ItemCartModel(
                                          id: items[index].id,
                                          item: items[index],
                                          quantity: 1,
                                          itemId:items[index].id,
                                          deliveryDate: DateTime.now(),
                                          notes: "",
                                          extras: []
                                      ));
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
