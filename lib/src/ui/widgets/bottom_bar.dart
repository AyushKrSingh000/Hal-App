// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hal/src/constants/constants.dart';

// 🌎 Project imports:

/// Bottom navigation bar for tab pages
class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  static final height = Platform.isIOS ? 80.0 : 60.0;

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 8,
              color: Colors.black.withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: BottomBar.height,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 7,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavigationBarItem(
                label: 'Home',
                icon: CupertinoIcons.home,
                isActive: context.tabsRouter.activeIndex == 0,
                onTap: () => context.tabsRouter.setActiveIndex(0),
              ),
              _NavigationBarItem(
                label: 'Rent',
                icon: CupertinoIcons.car_detailed,
                isActive: context.tabsRouter.activeIndex == 1,
                onTap: () => context.tabsRouter.setActiveIndex(1),
              ),
              _NavigationBarItem(
                label: 'Hire',
                icon: Icons.car_rental,
                isActive: context.tabsRouter.activeIndex == 2,
                onTap: () {
                  context.tabsRouter.setActiveIndex(2);
                },
              ),
              _NavigationBarItem(
                label: 'Profile',
                icon: Icons.person,
                isActive: context.tabsRouter.activeIndex == 3,
                onTap: () {
                  context.tabsRouter.setActiveIndex(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;

  const _NavigationBarItem({
    required this.label,
    required this.isActive,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Color(0xFFC2E854) : Colors.white;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 30,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.outfit(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
