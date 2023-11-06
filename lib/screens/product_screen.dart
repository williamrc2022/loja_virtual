import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/cart_product.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loja_virtual/models/cart_model.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/cart_screen.dart';
import 'package:loja_virtual/screens/login_screen.dart';

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
  final CarouselController _carouselController = CarouselController();

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(product.title!),
        centerTitle: true,

      ),
      
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
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

                Positioned(
                  bottom: 42,
                  left: 0,
                  right: 0,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: product.images!.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == index ? primaryColor : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
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
                        onTap: () {
                          setState(() {
                            sizes = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(
                              color:
                                  s == sizes ? primaryColor : Colors.grey[500]!,
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
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: sizes != null ? 
                    () {
                     if(UserModel.of(context).isLoggedIn()) {
                      
                       CartProduct cartProduct = CartProduct();
                            cartProduct.size = sizes;
                            cartProduct.quantity = 1;
                            cartProduct.pid = widget.product.id;
                            cartProduct.category = widget.product.category;
                            cartProduct.productData = widget.product;

                            CartModel.of(context).addCartItem(cartProduct);

                              Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const CartScreen())
                      );

                     } else {
                       Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                       );
                    
                     }
                    } : null,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    child:  Text( UserModel.of(context).isLoggedIn() ? "Adicionar ao Carrinho"
                    :  "Entre para Comprar" ,
                      style:  const TextStyle(fontSize: 18),
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
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
