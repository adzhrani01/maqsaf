import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/core/dialogs/logout_dialog.dart';
import 'package:maqsaf_app/screens/core/cubits/ingredients_cubit/ingredients_cubit.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';

import '../../constants/colors_constants.dart';
import '../../core/helpers/operation_file.dart';
import '../../core/widgets/image/image_food.dart';
import '../items/cubits/items_cubit/items_cubit.dart';
import '../items/data/models/food_model.dart';

class DeletedFoodsPage extends StatefulWidget {
  const DeletedFoodsPage({Key? key}) : super(key: key);

  @override
  State<DeletedFoodsPage> createState() => _DeletedFoodsPageState();
}

class _DeletedFoodsPageState extends State<DeletedFoodsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedFilters = ['الألبان'];

  final List<Map<String, String>> filters = [
    {'id': 'lebanon', 'label': 'الألبان'},
    {'id': 'nearby', 'label': 'Nearby'},
    {'id': 'pure-veg', 'label': 'Pure Veg'},
    {'id': 'ip', 'label': 'IP'},
  ];

  List<Map<String, dynamic>> foodItems = [
    {
      'id': 1,
      'title': 'الحليب و مشتقاته',
      'icon': '🥛',
      'status': 'ممنوع',
      'categories': ['lebanon', 'pure-veg']
    },
    {
      'id': 2,
      'title': 'المكسرات',
      'icon': '🥜',
      'status': 'ممنوع',
      'categories': ['lebanon', 'nearby']
    },
  ];

  void toggleFilter(String filterId) {
    setState(() {
      if (selectedFilters.contains(filterId)) {
        selectedFilters.remove(filterId);
      } else {
        selectedFilters.add(filterId);
      }
    });
  }

  void addNewFoodItem(String title, String icon) {
    setState(() {
      foodItems.add({
        'id': foodItems.length + 1,
        'title': title,
        'icon': icon,
        'status': 'ممنوع',
        'categories': ['lebanon'],
      });
    });
  }

  // List<Map<String, dynamic>> getFilteredFoods() {
  //   return foodItems.where((food) {
  //     bool matchesSearch = _searchController.text.isEmpty ||
  //         food['title']
  //             .toLowerCase()
  //             .contains(_searchController.text.toLowerCase());
  //     bool matchesFilters = selectedFilters.isEmpty ||
  //         (food['categories'] as List)
  //             .any((cat) => selectedFilters.contains(cat));
  //     return matchesSearch && matchesFilters;
  //   }).toList();
  // }
  List<FoodModel> getFilteredFoods() {

    // print(selectedFilters);
    // print(context.read<UserCubit>().user?.prohibitedIngredients?.map((e)=>"${e.id}").toList()??[]);
    return context.read<ItemsCubit>().items.where((food) {

      bool matchesSearch = _searchController.text.isEmpty ||
          (food.name?.toLowerCase().contains(_searchController.text.toLowerCase())??false);
      bool matchesFilters =
          // selectedFilters.isEmpty ||
          ((food.ingredients as List<int>?)??[])
              .any((ing) => selectedFilters.contains('${ing}'));
      return matchesSearch && matchesFilters;
    }).toList();
  }

  void _showAddItemDialog() {
    final titleController = TextEditingController();
    final iconController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إضافة عنصر جديد'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'اسم العنصر',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: iconController,
                  decoration: const InputDecoration(
                    labelText: 'الرمز التعبيري (مثال: 🍎)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      iconController.text.isNotEmpty) {
                    addNewFoodItem(titleController.text, iconController.text);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 137),
                ),
                child: const Text('إضافة'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    context.read<IngredientsCubit>().init(context);
    selectedFilters= context.read<UserCubit>().user?.prohibitedIngredients?.map((e)=>"${e.id}").toList()??[];

    context.read<ItemsCubit>().init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColor.myGradient?? LinearGradient(
            colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'الأطعمة المحذوفة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'قم بإزالة الأطعمة التي لا يفضلها ابنك أو التي تسبب الحساسية لمنعها من القائمة.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _searchController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'بحث عن أصناف',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child:     BlocBuilder<IngredientsCubit,IngredientsState>(
                buildWhen: (previous, current)=>context.read<IngredientsCubit>().buildCategoriesWhen(previous, current),
                builder: (context, state)=>
                    context.read<IngredientsCubit>().buildItems(context, state,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            ':المحذوفات',
                            style: TextStyle(color: Color(0xFF15445A)),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              children:

                              context.read<IngredientsCubit>().ingredients.map((filter) {
                              // filters.map((filter) {
                                bool isSelected = selectedFilters.contains("${filter.id}");
                                // bool isSelected = selectedFilters.contains(filter['id']);
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: FilterChip(
                                    label: Text(filter.name??''),
                                    // label: Text(filter['label']!),
                                    selected: isSelected,
                                    onSelected: (_) => toggleFilter("${filter.id}"),
                                    // onSelected: (_) => toggleFilter(filter['id']!),
                                    backgroundColor: Colors.white,
                                    selectedColor: Color(0xFF15445A),
                                    labelStyle: TextStyle(
                                      color:
                                      isSelected ? Colors.white : Color(0xFF15445A),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ))
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ':قائمة الطعام الحالية بعد الحذف',
                      style: TextStyle(color: Color(0xFF15445A)),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child:
                      BlocBuilder<ItemsCubit,ItemsState>(
                        buildWhen: (previous, current)=>context.read<ItemsCubit>().buildItemsWhen(previous, current),
                        builder: (context, state)=>
                            context.read<ItemsCubit>().buildItems(context, state,
                                GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  children: [
                                    ...getFilteredFoods().map((food) => FoodCard(
                                      image: getStorageUrl( food?.image),
                                      title: food.name??'',
                                      icon: "",
                                      status: foodItems.first['status'],
                                    )),
                                    // ...getFilteredFoods().map((food) => FoodCard(
                                    //   title: food['title'],
                                    //   icon: food['icon'],
                                    //   status: food['status'],
                                    // )),
                                    // Add New Item Button
                                    InkWell(
                                      onTap: _showAddItemDialog,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.red[400],
                                              size: 32,
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'العنصر غير متوفر؟',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                            )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<UserCubit>().updateStudents(context,
                            withBack: true,
                            prohibitedIngredients:


                            context.read<IngredientsCubit>().ingredients
                            .where((e)=>selectedFilters.contains("${e.id}")).toList()
                        ),
                        // onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'تأكيد',
                          style: TextStyle(
                            color: Color(0xFF009688),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String icon;
  final String status;
  final String? image;

  const FoodCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.status, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.isEmpty?
          Expanded(
            child: ImageFood(
                url:image,
                width: 150.w,
                // height: height * 0.25,
                fit: BoxFit.cover,
                foregroundColor:Colors.grey.shade400 ,
                backgroundColor:Colors.grey.shade200 ,

              ),
          )
                  :
              Text(
                icon,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
