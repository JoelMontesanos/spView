import 'package:flutter/material.dart';
import 'package:sp/models/models.dart';

class ItemSlider extends StatelessWidget {

  final List<Popular> populars;
  final String title;

  const ItemSlider({
    super.key, 
    required this.populars, 
    required this.title
    });

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
            child: Text(this.title, style: TextStyle(fontSize: 20))),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: populars.length,
              itemBuilder: (_, int index)=> _Poster(populars[index])
              ),
          )
        ],
      ),
    );
  }
}

class _Poster extends StatelessWidget {
    
    final Popular popular;
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
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'instance'),
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