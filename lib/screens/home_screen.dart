import 'package:flutter/material.dart';
import 'package:sp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          CardSwiper(),
          ItemSlider(),
        ],
      ),
      )
    );
  }
}