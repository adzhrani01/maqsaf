import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar>
    with SingleTickerProviderStateMixin {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  String _activeFilter = 'Today';
  final List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mai',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleFilterChange(String filter) {
    setState(() {
      _activeFilter = filter;

      switch (filter) {
        case 'Today':
          _selectedDay = DateTime.now();
          _focusedDay = DateTime.now();
          break;
        case 'Last 8 days':
          final now = DateTime.now();
          _selectedDay = now.subtract(const Duration(days: 8));
          _focusedDay = now;
          break;
        case 'Last month':
          final now = DateTime.now();
          _selectedDay = DateTime(now.year, now.month - 1, now.day);
          _focusedDay = now;
          break;
        case 'Last 3 months':
          final now = DateTime.now();
          _selectedDay = DateTime(now.year, now.month - 3, now.day);
          _focusedDay = now;
          break;
        case 'Last 6 months':
          final now = DateTime.now();
          _selectedDay = DateTime(now.year, now.month - 6, now.day);
          _focusedDay = now;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: _buildMonthsList(),
          ),
          Container(
            width: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildMainCalendar(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCalendar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: _fadeAnimation,
            child: TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              rowHeight: 30,
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                outsideDaysVisible: true,
                outsideTextStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 12,
                ),
                weekendTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                ),
                defaultTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              headerVisible: false,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
                weekendStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_months[_focusedDay.month - 1]} ${_focusedDay.year}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildHeaderButton('Today', _activeFilter == 'Today'),
              const SizedBox(width: 6),
              _buildHeaderButton('Last 8 days', _activeFilter == 'Last 8 days'),
              const SizedBox(width: 6),
              _buildHeaderButton('Last month', _activeFilter == 'Last month'),
              const SizedBox(width: 6),
              PopupMenuButton<String>(
                onSelected: _handleFilterChange,
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'Last 3 months',
                    child: Text('Last 3 months'),
                  ),
                  PopupMenuItem(
                    value: 'Last 6 months',
                    child: Text('Last 6 months'),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.keyboard_arrow_down,
                      size: 16, color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderButton(String text, bool isActive) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handleFilterChange(text),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color:
                isActive ? Colors.orange.withOpacity(0.1) : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.orange : Colors.grey.shade800,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        itemCount: _months.length,
        itemBuilder: (context, index) {
          final isCurrentMonth = index == _focusedDay.month - 1;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 1),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _focusedDay = DateTime(_focusedDay.year, index + 1, 1);
                    _selectedDay = _focusedDay;
                    _animationController.reset();
                    _animationController.forward();
                  });
                },
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: isCurrentMonth ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: isCurrentMonth
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    _months[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          isCurrentMonth ? Colors.black : Colors.grey.shade400,
                      fontWeight:
                          isCurrentMonth ? FontWeight.bold : FontWeight.normal,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
