import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:maqsaf_app/core/helpers/extensions.dart';
import 'package:maqsaf_app/screens/payment_carts/cubits/payment_carts_cubit/payment_carts_cubit.dart';
import 'package:maqsaf_app/screens/payment_carts/data/models/payment_cart_model.dart';

import '../../constants/colors_constants.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import 'cubits/payment_cart_cubit/payment_cart_cubit.dart';

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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال اسم حامل البطاقة';
                                }
                                return null;
                              },
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
                                  validator: (value) {
                                    if (expiryDate == null || expiryDate.isEmpty) {
                                      return 'الرجاء إدخال تاريخ الانتهاء';
                                    }

                                   if(intl.DateFormat("MM/yy").tryParse(expiryDate)==null
                                   &&intl.DateFormat("MM\\yy").tryParse(expiryDate)==null
                                   ) return 'الرجاء إدخال تاريخ صحيح';

                                    if(
                                    (intl.DateFormat("MM/yy").tryParse(expiryDate)?.isBefore(DateTime.now())??true)
                                    &&(intl.DateFormat("MM\\yy").tryParse(expiryDate)?.isBefore(DateTime.now())??true)

                                    )
                                      return 'الرجاء إدخال تاريخ صالح';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      cvv = value;

                                    });
                                  },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال تاريخ الانتهاء';
                                      }
                                      if(value.length!=3) return 'الرجاء إدخال رقم صالح';

                                      return null;
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
                                context.read<PaymentCartCubit>().createPaymentCart(context
                                ,paymentCart: PaymentCartModel(
                                      name: cardHolderName,
                                      number: cardNumber,
                                      cvv:cvv,
                                      isDefault: false,
                                      expireDate:
                                      intl.DateFormat("MM/yy").tryParse(expiryDate)==null?
                                          intl.DateFormat("MM\\yy").tryParse(expiryDate):
                                      intl.DateFormat("MM/yy").tryParse(expiryDate)
                                    ));
                                // Navigator.pop(context);
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
      isDefault: true,
    ),
    CreditCard(
      cardNumber: '**** **** **** 5678',
      cardHolderName: ' محمد أحمد',
      expiryDate: '09/24',
      cardType: 'ماستر كارد',
      color: Colors.orange,
      isDefault: false,
    ),
  ];

  String selectedFilter = 'الكل';
  List<String> filters = ['الكل', 'فيزا', 'ماستر كارد', 'أمريكان إكسبرس'];
  @override
  void initState() {
    context.read<PaymentCartsCubit>().init(context);
    super.initState();
  }
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

              //ListView.builder(
              //                               itemCount: savedCards.length,
              //                               itemBuilder: (context, index) {
              //                                 final card = savedCards[index];
              //                                 if (selectedFilter == 'الكل' ||
              //                                     selectedFilter == card.cardType) {
              //                                   return Card3D(
              //                                     child: CreditCardWidget(card: card),
              //                                     onTap: () {},
              //                                   );
              //                                 }
              //                                 return const SizedBox.shrink();
              //                               },
              //                             )
              // Cards List
              Expanded(
                child:  BlocBuilder<PaymentCartsCubit,PaymentCartsState>(
                    buildWhen: (previous, current)=>context.read<PaymentCartsCubit>().buildItemsWhen(previous, current),
                    builder: (context, state)=>
                        context.read<PaymentCartsCubit>().buildItems(context, state,
                            ListView.builder(
                              itemCount: context.read<PaymentCartsCubit>().items.length,
                              itemBuilder: (context, index) {
                                final card = context.read<PaymentCartsCubit>().items[index];
                                final savedCard=savedCards[Random().nextInt(savedCards.length-1)];
                                if (selectedFilter == 'الكل' ||
                                    selectedFilter == card.type||
                                    selectedFilter == savedCard.cardType
                                ) {
                                  return Card3D(
                                    child: CreditCardWidget(card: CreditCard(cardNumber:
                                    card.number??""
                                        , cardHolderName: card.name??"",
                                        expiryDate:intl.DateFormat("MM/yy").format( card?.expireDate??DateTime.now()),
                                         isDefault: card.isDefault??false,
                                         cardType: card.type??savedCard.cardType
                                        , color: savedCard.color)),
                                    onTap: () {
                                      final width = SizeConfig.sizeWidth(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context1) {
                                          return Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Header
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                            color:
                                                            AppColor.primaryColor.withOpacity(0.1),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          child: Icon(
                                                            Icons.verified_outlined,
                                                            color: AppColor.primaryColor,
                                                            size: width * 0.06,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 12),
                                                        Text(
                                                          'اختيار كبطاقة افتراضية',
                                                          style: TextStyle(
                                                            fontSize: width * 0.05,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(height: 30),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(context1);

                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: AppColor.primaryColor
                                                                  .withOpacity(0.1),
                                                              foregroundColor: AppColor.primaryColor,
                                                              elevation: 0,
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 12),
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              'الغاء',
                                                              style: TextStyle(fontSize: width * 0.04),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              context1.pop();
                                                              context.read<PaymentCartCubit>().setDefault(context,
                                                                  paymentCartId:card.id,
                                                                onSuccess: ()=>context.read<PaymentCartsCubit>().onRefresh(context)
                                                              );
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: AppColor.primaryColor,
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 12),
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              'تأكيد',
                                                              style: TextStyle(
                                                                fontSize: width * 0.04,
                                                                color: Colors.white,
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
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ))
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
  final bool isDefault;
  final Color color;

  CreditCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.isDefault,
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
                Visibility(
                  visible: card.isDefault,
                  child: const Icon(
                    Icons.verified_outlined,
                    color: Colors.white,
                    size: 32,
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
