import 'package:flutter/material.dart';
import 'package:sp/models/models.dart';

class ItemSlider extends StatefulWidget {

  final List<Product> product;
  final String title;
  final Function onNext;

  const ItemSlider({
    super.key, 
    required this.product, 
    required this.title, 
    required this.onNext
    });

  @override
  State<ItemSlider> createState() => _ItemSliderState();
}

class _ItemSliderState extends State<ItemSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 ){
        widget.onNext();
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 281,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Text(this.widget.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.product.length,
              itemBuilder: (_, int index)=> _Poster(widget.product[index])
              ),
          )
        ],
      ),
    );
  }
}

class _Poster extends StatelessWidget {
    
    final Product popular;
    const _Poster (this.popular);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, ),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: popular),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(popular.imagen),
                fit: BoxFit.cover,
                ),
            ),
          ),
          Text(popular.nombre, overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}