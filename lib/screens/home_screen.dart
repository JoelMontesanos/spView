import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp/providers/providers.dart';
import 'package:sp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final producProvider = Provider.of<ProductProvider>(context);
  
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo'),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black,size: 25,))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
        children: [
          CardSwiper(products: producProvider.on,),
          ItemSlider(
            populars: producProvider.onPopulars,//populares
            title: 'Populares!!'
            ),
        ],
      ),
      )
    );
  }
}