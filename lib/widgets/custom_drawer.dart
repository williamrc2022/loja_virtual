import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController  pageController;
   const CustomDrawer(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildDrawerBack() => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );
  
    return Drawer(
      child: Stack(
        children: [
          buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16, 5.0),
                height: 190.0,
                child: Stack(
                  children: [
                    const Positioned(
                      top: 10.0,
                      left: 0.0,
                      child: Text(
                        "Fashion Fit \n  Clothing",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.w900),
                        
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá,",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              child: Text(
                                "Entre ou cadastre-se >",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
