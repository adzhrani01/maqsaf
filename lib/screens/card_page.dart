import 'package:flutter/material.dart';

class SavedCardsPage extends StatefulWidget {
  const SavedCardsPage({super.key});

  @override
  _SavedCardsPageState createState() => _SavedCardsPageState();
}

class AddCardModal extends StatefulWidget {
  const AddCardModal({super.key});

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
      duration: const Duration(milliseconds: 500),
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'إضافة بطاقة جديدة',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _flipCard,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: isCardFlipped ? 180 : 0,
                    ),
                    duration: const Duration(milliseconds: 300),
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
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF0DA9A6),
                                      Color(0xFF07A869)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.memory,
                                            color: Colors.white,
                                            size: 40), 
                                        Icon(Icons.credit_card,
                                            color: Colors.white),
                                      ],
                                    ),
                                    Text(
                                      cardNumber.isEmpty
                                          ? '**** **** **** ****'
                                          : cardNumber,
                                      style: const TextStyle(
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
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          expiryDate.isEmpty
                                              ? 'MM/YY'
                                              : expiryDate,
                                          style: const TextStyle(color: Colors.white),
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
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF0DA9A6),
                                        Color(0xFF07A869)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
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
                                            const EdgeInsets.symmetric(vertical: 15),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(right: 40),
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
                                                style: const TextStyle(
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
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'رقم البطاقة',
                              border: OutlineInputBorder(),
                              hintText: 'XXXX XXXX XXXX XXXX',
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 19, 
                            onChanged: (value) {
                              value = value.replaceAll(' ', '');
                              if (value.length > 16) {
                                value = value.substring(0, 16);
                              }
                              final buffer = StringBuffer();
                              for (int i = 0; i < value.length; i++) {
                                buffer.write(value[i]);
                                if ((i + 1) % 4 == 0 && i != 15) {
                                  buffer.write(' ');
                                }
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
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'اسم حامل البطاقة',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                cardHolderName = value;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
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
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
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
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Text(
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
      cardHolderName: ' محمد أحمد',
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'البطاقات المحفوظة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
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

              // Cards List
              Expanded(
                child: ListView.builder(
                  itemCount: savedCards.length,
                  itemBuilder: (context, index) {
                    final card = savedCards[index];
                    if (selectedFilter == 'الكل' ||
                        selectedFilter == card.cardType) {
                      return Card3D(
                        child: CreditCardWidget(card: card),
                        onTap: () {},
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddCardModal(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
      duration: const Duration(milliseconds: 300),
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

class CreditCardWidget extends StatelessWidget {
  final CreditCard card;

  CreditCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
            Text(
              card.cardNumber,
              style: const TextStyle(
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
                    const Text(
                      'حامل البطاقة',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      card.cardHolderName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'تاريخ الانتهاء',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      card.expiryDate,
                      style: const TextStyle(
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
