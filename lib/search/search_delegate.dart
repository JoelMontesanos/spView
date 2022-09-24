import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp/providers/products_provider.dart';

import '../models/models.dart';

class ProductSearchDelegate extends SearchDelegate{


  Widget _emptyContainer(){
    return Container(
        child: Center(
          child: Icon(Icons.search, color: Colors.grey, size: 150,),
        ),
      ); 
  }



  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar Postre';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: ()=>query='', 
        icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: ()=> close(context, null), 
      icon: Icon(Icons.arrow_back_ios),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Hola buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return   _emptyContainer();   
    }

  final searchProvider = Provider.of<ProductProvider>(context, listen: false);

    return FutureBuilder(
      future: searchProvider.searchProducts(query),
      builder: (_, AsyncSnapshot<List<Product>> snapshot) {

        if(!snapshot.hasData) return _emptyContainer();

        final products = snapshot.data;

        return ListView.builder(
          itemCount: products!.length,
          itemBuilder: (_, int index) => _ProductItem(product: products[index],),
          );
      },
    );
  }
}

class _ProductItem extends StatelessWidget {

  final Product product;

  const _ProductItem({
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'), 
        image: NetworkImage(product.imagen),
        width: 50,
        fit: BoxFit.contain,
        ),
    );
  }
}