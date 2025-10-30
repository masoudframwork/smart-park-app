import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_park_app/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/home_bottom_nav_bar.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  DateTime? lastBackPressTime;

  @override
  void initState() {
    super.initState();

    lastBackPressTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: IndexedStack(
                    index: ref.watch(bottomNavBarController).currentIndex,
                    children: ref.read(bottomNavBarController).pages,
                  ),
                ),
                CustomButtonWidget(
                    width: 300,
                    type: ButtonType.elevated,

                   label:   Text(
                      'حجز موقف',
                      ),
                    onPressed: () {
                      NavigationService.push('/durationScreen',
                          context: context);
                    }),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const SafeArea(child: HomeBottomNavigationBar()),
    );
  }
}
