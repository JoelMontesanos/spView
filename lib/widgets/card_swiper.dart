import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sp/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Product> products;

  const CardSwiper({
    required this.products
    }); 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(this.products.length == 0){
      return Container(
        width: double.infinity,
        height: size.height*.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }



    return Container(
      width: double.infinity,
      height: size.height*.5,
      //color: Colors.blue,
      child: Swiper(
        itemCount: products.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*.6,
        itemHeight: size.height*.4,
        itemBuilder: (_, int index){

          final product = products[index];

          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: product),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(product.imagen),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}