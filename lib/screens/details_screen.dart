import 'package:flutter/material.dart';
import 'package:sp/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final String item = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-item';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _customAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(),
                _OverView(),
                CarruselCards(),
              ]
            ),
          ),
        ],
      )
    );
  }
}

class _customAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 15),
          color: Colors.black45,
          child: Text(
            'product.title',
            style: TextStyle(fontSize: 25),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}
class _PosterAndTitle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('product.title',style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('product.Slogan',style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),
              Row(
                children: [
                  Icon(Icons.star_outline,size: 25, color: Colors.yellow,),
                  SizedBox(width: 5,),
                  Text('product.average',style: Theme.of(context).textTheme.caption,)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Incididunt et voluptate laboris dolor et esse. Officia enim esse est nulla amet Lorem minim pariatur mollit in ut cillum. Tempor amet est nisi non ad non nisi ullamco. Eu exercitation fugiat ex tempor sunt cillum ipsum elit quis quis sint do laboris.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}