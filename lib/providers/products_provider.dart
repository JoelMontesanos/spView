import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp/models/models.dart';


class ProductProvider extends ChangeNotifier{

  String _baseUrl = 'mobilecatalogapp.herokuapp.com';

  List<Product> on = [];
  List<Product> onPopulars =[];
  List<Product> search = [];


  ProductProvider(){
    print('initialization...');
    this.getOndisplayProducts();
    this.getPopulars();
    print('Initialized');
  }

  getOndisplayProducts()async{
    //print('Getting Producs...');
    var url = Uri.https(_baseUrl, '');
    var response = await http.get(url);//Answer is in text
    final lista = List.from(jsonDecode(response.body));//decoded body text into a List
    lista.forEach((element) {
      final Product product = Product.fromJson(element);
      on.add(product);
      notifyListeners();
    });
    notifyListeners();
    //print('Products obteined');
  }

  getPopulars()async{
    //print('Getting Populars Products...');
    var url = Uri.https(_baseUrl, '/populares');
    var response = await http.get(url);
    final lista = List.from(jsonDecode(response.body));
    lista.forEach((element) {
      final Product productPopular = Product.fromJson(element);
      onPopulars.add(productPopular);
      notifyListeners();
    });
    //print('Popular Products obteined');
  }

  Future<List<Product>> searchProducts (String query)async { //No está haciendo el requesta con el nombre específico hacia el backend
    var url = Uri.https(_baseUrl,'/' );// aquí se debe incluir el 'query' en la petición.
    var response = await http.get(url);
    final searchResponse = List.from(jsonDecode(response.body));
    searchResponse.forEach((element){
      final Product searching = Product.fromJson(element);
      search.add(searching);
    });
    return search;
  }

}