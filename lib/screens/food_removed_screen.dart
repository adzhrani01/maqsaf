import 'package:flutter/material.dart';

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

  List<Map<String, dynamic>> getFilteredFoods() {
    return foodItems.where((food) {
      bool matchesSearch = _searchController.text.isEmpty ||
          food['title']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
      bool matchesFilters = selectedFilters.isEmpty ||
          (food['categories'] as List)
              .any((cat) => selectedFilters.contains(cat));
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[50],
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ':المحذوفات',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      children: filters.map((filter) {
                        bool isSelected =
                            selectedFilters.contains(filter['id']);
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: FilterChip(
                            label: Text(filter['label']!),
                            selected: isSelected,
                            onSelected: (_) => toggleFilter(filter['id']!),
                            backgroundColor: Colors.white,
                            selectedColor: Colors.teal[600],
                            labelStyle: TextStyle(
                              color:
                                  isSelected ? Colors.white : Colors.grey[600],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ':قائمة الطعام الحالية بعد الحذف',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          ...getFilteredFoods().map((food) => FoodCard(
                                title: food['title'],
                                icon: food['icon'],
                                status: food['status'],
                              )),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
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

  const FoodCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.status,
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
