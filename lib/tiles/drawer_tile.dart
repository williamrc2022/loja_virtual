import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
const DrawerTile(this.icon, this.text, {super.key});

  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          
        },
        child: SizedBox(
        height: 60.0,
        child: Row(
          children: [
            Icon(
              icon,
              size: 32.0,
              color: Colors.black,
            ),
            const SizedBox(width: 32.0,),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                 
              ),
            )
          ], 
        ),
      ),
      ),
    );
  }
}