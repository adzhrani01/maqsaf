import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/core/dialogs/logout_dialog.dart';
import 'package:maqsaf_app/core/helpers/spacing.dart';

class CafeteriaOrder {
  final String id;
  final String orderNumber;
  final String date;
  final String time;
  final String status;
  final List<String> items;
  final double total;

  CafeteriaOrder({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.status,
    required this.items,
    required this.total,
  });
}

class CafeteriaOrdersWidget extends StatefulWidget {
  const CafeteriaOrdersWidget({Key? key}) : super(key: key);

  @override
  State<CafeteriaOrdersWidget> createState() => _CafeteriaOrdersWidgetState();
}

class _CafeteriaOrdersWidgetState extends State<CafeteriaOrdersWidget> {
  int _currentIndex = 0;

  final List<CafeteriaOrder> orders = [
    CafeteriaOrder(
      id: '1',
      orderNumber: 'ORD-001',
      date: '2024-12-16',
      time: '10:30',
      status: 'pending',
      items: ['ساندويتش دجاج', 'عصير برتقال'],
      total: 25.0,
    ),
    CafeteriaOrder(
      id: '2',
      orderNumber: 'ORD-002',
      date: '2024-12-16',
      time: '11:15',
      status: 'completed',
      items: ['سلطة', 'ماء معدني'],
      total: 15.0,
    ),
    CafeteriaOrder(
      id: '3',
      orderNumber: 'ORD-003',
      date: '2024-12-16',
      time: '12:00',
      status: 'cancelled',
      items: ['برجر لحم', 'بطاطس'],
      total: 35.0,
    ),
  ];

  void _goToNext() {
    if (_currentIndex < orders.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.amber;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending':
        return 'قيد الانتظار';
      case 'completed':
        return 'مكتمل';
      case 'cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.access_time;
      case 'completed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentOrder = orders[_currentIndex];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: _currentIndex > 0 ? _goToPrevious : null,
              color: _currentIndex > 0 ? Colors.black : Colors.grey,
            ),
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'طلب #${currentOrder.orderNumber}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                            horizontalSpace(10.w),
                            Chip(
                              avatar: Icon(
                                _getStatusIcon(currentOrder.status),
                                color: Colors.white,
                                size: 18,
                              ),
                              label: Text(
                                _getStatusText(currentOrder.status),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              backgroundColor:
                                  _getStatusColor(currentOrder.status),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 4),
                          Text(currentOrder.date),
                          const SizedBox(width: 16),
                          const Icon(Icons.access_time, size: 16),
                          const SizedBox(width: 4),
                          Text(currentOrder.time),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'المنتجات:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...currentOrder.items.map((item) => Padding(
                            padding:
                                const EdgeInsets.only(right: 16, bottom: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.circle, size: 8),
                                const SizedBox(width: 8),
                                Text(item),
                              ],
                            ),
                          )),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      Text(
                        'الإجمالي: ${currentOrder.total} ريال',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _currentIndex < orders.length - 1 ? _goToNext : null,
              color: _currentIndex < orders.length - 1
                  ? Colors.black
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
