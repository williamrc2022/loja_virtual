import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
   const CustomDrawer({super.key});

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
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16, 8.0),
                height: 170.0,
                child:  Stack(
                  children: [
                    const Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter's \nClothing",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
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
                           GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se >",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor
                              ),
                              ) ,
                            onTap: (){},
                           )
                          ],
                        )),
                  ],
                ),
              ),
              Divider(),
              const DrawerTile(Icons.home, "Início"),
              const DrawerTile(Icons.list, "Produtos"),
              const DrawerTile(Icons.location_on, "Lojas"),
              const DrawerTile(Icons.playlist_add_check, "Meus Pedidos"),
            ],
          )
        ],
      ),
    );
  }
}
