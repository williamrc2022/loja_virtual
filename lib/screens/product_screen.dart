import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;
  const ProductScreen(this.product, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  String? sizes;
  int current = 0;
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: CarouselSlider(
              items: product.images!.map((e) {
                return Image.network(
                  e,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 1.0,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$${product.price!}",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Tamanho",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    
                    children: product.sizes!.map((s) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            sizes = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(
                              color: s == sizes ? primaryColor : Colors.grey[500]!,
                              width: 3.0,
                            ),
                          ),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 16.0,),

                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: sizes != null ? 
                    (){} : null,
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor), 
                    child: const Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(fontSize: 18),
                    ),
                    
                    
                  ),
                ),

                const SizedBox(height: 16.0),

                 const Text(
                  "Descrição do Produto",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  product.description!,
                  style: const TextStyle(
                    fontSize: 16.0
                  ),
                ),



              ],
            ),
          )
        ],
      ),
    );
  }
}
