import 'package:flutter/material.dart';

class ItemSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Text('Los más pedidos!', style: TextStyle(fontSize: 20))),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index)=> _Poster()
              ),
          )
        ],
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  
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
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                ),
            ),
          ),
          Text('Item name', overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}