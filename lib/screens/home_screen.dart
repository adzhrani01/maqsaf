import 'package:flutter/material.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/screens/charge_balance_screen.dart';
import 'package:maqsaf_app/screens/chatgpt_screen.dart';
import 'package:maqsaf_app/screens/home_page.dart';
import 'package:maqsaf_app/screens/my_favorite_screen.dart';
import 'package:maqsaf_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  static const Color _navBarColor = Color(0xFF1B3F4F);

  final List<Widget> _pages = const [
    HomePage(),
    MyFavoriteScreen(),
    ChatgptScreen(),
    ChargeBalanceScreen(),
    ProfileScreen(),
  ];

  final List<NavItem> _navItems = [
    NavItem(icon: Icons.home_rounded, label: 'الرئيسية'),
    NavItem(icon: Icons.favorite_rounded, label: 'المفضلة'),
    NavItem(
      isCenter: true,
      icon: Icons.chat_bubble_rounded,
      label: 'المساعد',
      imagePath: AssetsPath.image,
    ),
    NavItem(
      icon: Icons.account_balance_wallet_rounded,
      label: 'المحفظة',
      imagePath: AssetsPath.wallet,
    ),
    NavItem(
      icon: Icons.person_rounded,
      label: 'حسابي',
      imagePath: AssetsPath.group,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() => _currentIndex = index);
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey[100]!],
              ),
            ),
            child: _pages[_currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 85,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildCustomNavBar(),
            _buildCenterFloatingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomNavBar() {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: _navBarColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navItems.length,
              (index) => index == 2
                  ? const SizedBox(width: 90) // مساحة للزر المركزي
                  : _buildNavItem(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _navItems[index];
    final isSelected = _currentIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(item, isSelected),
              const SizedBox(height: 6),
              _buildLabel(item.label, isSelected),
              _buildSelectionIndicator(isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(NavItem item, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isSelected ? 4 : 0),
      child: item.imagePath != null
          ? Image.asset(
              item.imagePath!,
              height: 24,
              width: 24,
              color: Colors.white,
            )
          : Icon(
              item.icon,
              color: Colors.white,
              size: 24,
            ),
    );
  }

  Widget _buildLabel(String label, bool isSelected) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildSelectionIndicator(bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(top: 6),
      height: 3,
      width: isSelected ? 25 : 0,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(2),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildCenterFloatingButton() {
    return Positioned(
      top: -35,
      left: 0,
      right: 0,
      child: CenterFloatingButton(
        isSelected: _currentIndex == 2,
        onTap: () => _onItemTapped(2),
        imagePath: AssetsPath.image,
      ),
    );
  }
}

class CenterFloatingButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String imagePath;

  const CenterFloatingButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  static const Color _buttonStartColor = Color(0xFF2D91C0);
  static const Color _buttonEndColor = Color(0xFF15445A);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 70,
          height: 70,
          padding: EdgeInsets.only(top: isSelected ? 4 : 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_buttonStartColor, _buttonEndColor],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? _buttonEndColor : Colors.black87,
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 35,
                width: 35,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;
  final String? imagePath;
  final bool isCenter;

  const NavItem({
    required this.icon,
    required this.label,
    this.imagePath,
    this.isCenter = false,
  });
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo((size.width / 2) - 45, 0);

    path.arcToPoint(
      Offset((size.width / 2) + 45, 0),
      radius: const Radius.circular(45),
      clockwise: false,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
