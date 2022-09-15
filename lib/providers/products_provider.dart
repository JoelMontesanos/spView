import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  ProductProvider(){
    print('initialization started');
    this.getOndisplayProducts();
  }

  getOndisplayProducts(){
    print('getOnDisplayProducts');
  }

}