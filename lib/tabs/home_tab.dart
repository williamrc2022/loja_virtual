import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildBodyBack() => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: [
        buildBodyBack(),
         CustomScrollView(
          slivers: [
          const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(future: FirebaseFirestore.instance.collection("home").orderBy("pos").get(),
             builder: (context, snapshot){
             if (!snapshot.hasData){
             return SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),

                ),
                
              ),
             );
             }
             else {
             return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.docs.length,
                (context, index) => FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                 image: snapshot.data!.docs[index]['image'],
                 fit: BoxFit
                 .cover,   //para cobrir todo o espaço possível na tile
                 
                 )
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: snapshot.data!.docs.map((doc){
                  return QuiltedGridTile(doc['x'], doc['y']);
                }).toList(),
                
                ),
                );

             }

             },
            )
          ],
        )
      ],
    );
  }
}
