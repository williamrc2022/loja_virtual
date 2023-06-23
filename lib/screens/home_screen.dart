import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/products_tab.dart';
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
      children:    [
        Scaffold(
          body: const HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),

        Scaffold(
          appBar: AppBar(
            title: const Text("Produtos"),
            centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: const ProductsTab(),

        ),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,)
      ],
    );
  }
}
