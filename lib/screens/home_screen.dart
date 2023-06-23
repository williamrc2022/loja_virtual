import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

import '../tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:  const [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}
