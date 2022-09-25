import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp/providers/providers.dart';
//import 'package:sp/search/search_delegate.dart';
import 'package:sp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final producProvider = Provider.of<ProductProvider>(context);
  
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo'),
        elevation: 0,
        /*actions: [
          //IconButton(onPressed: ()=>showSearch(context: context, delegate: ProductSearchDelegate()) ,
          icon: Icon(Icons.search, color: Colors.black,size: 25,))
        ],*/
      ),
      body:SingleChildScrollView(
        child: Column(
        children: [
          CardSwiper(products: producProvider.on,),
          ItemSlider(
            product: producProvider.onPopulars,//populares
            title: 'Populares!!',
            onNext: ()=>producProvider.getPopulars(),
            ),
        ],
      ),
      )
    );
  }
}