import 'package:flutter/material.dart';

class SavedCardsPage extends StatefulWidget {
  @override
  _SavedCardsPageState createState() => _SavedCardsPageState();
}

class AddCardModal extends StatefulWidget {
  @override
  _AddCardModalState createState() => _AddCardModalState();
}

class _AddCardModalState extends State<AddCardModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final _formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool isCardFlipped = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() {
      isCardFlipped = !isCardFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              0, (1 - _animation.value) * MediaQuery.of(context).size.height),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'إضافة بطاقة جديدة',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _flipCard,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: isCardFlipped ? 180 : 0,
                    ),
                    duration: Duration(milliseconds: 300),
                    builder: (context, double value, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY((value * 3.1415927) / 180),
                        alignment: Alignment.center,
                        child: value < 90
                            ? Container(
                                width: 300,
                                height: 180,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.memory,
                                            color: Colors.white,
                                            size: 40), // رمز الشريحة
                                        Icon(Icons.credit_card,
                                            color: Colors.white),
                                      ],
                                    ),
                                    Text(
                                      cardNumber.isEmpty
                                          ? '**** **** **** ****'
                                          : cardNumber,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cardHolderName.isEmpty
                                              ? 'اسم حامل البطاقة'
                                              : cardHolderName,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          expiryDate.isEmpty
                                              ? 'MM/YY'
                                              : expiryDate,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Transform(
                                transform: Matrix4.identity()
                                  ..rotateY(3.1415927),
                                alignment: Alignment.center,
                                child: Container(
                                  width: 300,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey[800]!,
                                        Colors.grey[600]!
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        height: 40,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 15),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              width: 60,
                                              height: 30,
                                              alignment: Alignment.center,
                                              child: Text(
                                                cvv.isEmpty ? 'CVV' : cvv,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'رقم البطاقة',
                              border: OutlineInputBorder(),
                              hintText: 'XXXX XXXX XXXX XXXX',
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 19, // 16 أرقام + 3 مسافات
                            onChanged: (value) {
                              // تنسيق رقم البطاقة بإضافة مسافات كل 4 أرقام
                              value = value.replaceAll(' ', '');
                              if (value.length > 16)
                                value = value.substring(0, 16);
                              final buffer = StringBuffer();
                              for (int i = 0; i < value.length; i++) {
                                buffer.write(value[i]);
                                if ((i + 1) % 4 == 0 && i != 15)
                                  buffer.write(' ');
                              }
                              setState(() {
                                cardNumber = buffer.toString();
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال رقم البطاقة';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'اسم حامل البطاقة',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                cardHolderName = value;
                              });
                            },
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'تاريخ الانتهاء',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      expiryDate = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      cvv = value;
                                    });
                                  },
                                  onTap: () {
                                    if (!isCardFlipped) _flipCard();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // حفظ البطاقة
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'إضافة البطاقة',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SavedCardsPageState extends State<SavedCardsPage> {
  // نموذج للبطاقات المحفوظة
  List<CreditCard> savedCards = [
    CreditCard(
      cardNumber: '**** **** **** 1234',
      cardHolderName: 'أحمد محمد',
      expiryDate: '12/25',
      cardType: 'فيزا',
      color: Colors.blue,
    ),
    CreditCard(
      cardNumber: '**** **** **** 5678',
      cardHolderName: 'سارة أحمد',
      expiryDate: '09/24',
      cardType: 'ماستر كارد',
      color: Colors.orange,
    ),
  ];

  String selectedFilter = 'الكل';
  List<String> filters = ['الكل', 'فيزا', 'ماستر كارد', 'أمريكان إكسبرس'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('البطاقات المحفوظة'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // قسم الفلاتر
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(filters[index]),
                    selected: selectedFilter == filters[index],
                    onSelected: (selected) {
                      setState(() {
                        selectedFilter = filters[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // قائمة البطاقات
          Expanded(
            child: ListView.builder(
              itemCount: savedCards.length,
              itemBuilder: (context, index) {
                final card = savedCards[index];
                if (selectedFilter == 'الكل' ||
                    selectedFilter == card.cardType) {
                  return Card3D(
                    child: CreditCardWidget(card: card),
                    onTap: () {
                      // معالجة حدث النقر على البطاقة
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddCardModal(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// ويدجت البطاقة ثلاثية الأبعاد
class Card3D extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  Card3D({required this.child, required this.onTap});

  @override
  _Card3DState createState() => _Card3DState();
}

class _Card3DState extends State<Card3D> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationX = 0;
  double _rotationY = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _rotationY += details.delta.dx / 100;
          _rotationX += details.delta.dy / 100;
        });
      },
      onPanEnd: (_) {
        setState(() {
          _rotationX = 0;
          _rotationY = 0;
        });
      },
      onTap: widget.onTap,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_rotationX)
          ..rotateY(_rotationY),
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}

// نموذج البطاقة
class CreditCard {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final Color color;

  CreditCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.color,
  });
}

// ويدجت عرض البطاقة
class CreditCardWidget extends StatelessWidget {
  final CreditCard card;

  CreditCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardType,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
            Text(
              card.cardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'حامل البطاقة',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      card.cardHolderName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تاريخ الانتهاء',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      card.expiryDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
