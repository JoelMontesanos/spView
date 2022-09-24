import 'package:flutter/material.dart';
import 'package:sp/models/models.dart';
import 'package:sp/providers/products_provider.dart';
import 'package:sp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final producProvider = Provider.of<ProductProvider>(context);


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _customAppbar(product: product,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(product: product,),
                _OverView(product: product,),
                _Button(product: product,),                
                ItemSlider(
                  product: producProvider.onPopulars,//populares
                  title: 'Populares!!',
                  onNext: ()=>producProvider.getPopulars(),
                  ),
              ]
            ),
          ),
        ],
      )
    );
  }
}

class _customAppbar extends StatelessWidget {

  final Product product;

  const _customAppbar({
    required this.product
    });

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
            product.nombre,
            style: TextStyle(fontSize: 25),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage(product.imagen),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}
class _PosterAndTitle extends StatelessWidget {

  final Product product;

  const _PosterAndTitle({
    required this.product
    });
  
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
              image: NetworkImage(product.imagen),
              width: 138,// para poder ajustar el tamaño de la imagen descriptiva en detalles
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.nombre,style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Row(
                children: [
                  Icon(Icons.attach_money),
                  Text( product.costo,style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),
                ],
              ),              
              Row(
                children: [
                  Icon(Icons.star,size: 25, color: Colors.yellow,),
                  SizedBox(width: 5,),
                  Text('Producto Estrella',style: Theme.of(context).textTheme.caption,)
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

  final Product product;

  const _OverView({
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(product.detalles,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _Button extends StatelessWidget {

  final Product product;

  const _Button({
    required this.product
    });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          _launch(product);
        },
        child:Ink(
          height: MediaQuery.of(context).size.height/15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.whatsapp,size: 30, color: Colors.white,),
                SizedBox(width: 10,),
                Text('Lo quiero!!', 
                  style: TextStyle(
                  color: Colors.white, 
                  fontSize: 25, 
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),   
          )
      ),
    );
  }
}

Future<void> _launch(Product product) async {
  var nombre = product.nombre.toString();
  var image = product.imagen;
  final Uri _url = Uri.parse(
    'whatsapp://send?phone=524425458784+&text=Me interesa el siguiente producto:+%0A+*${Uri.encodeComponent(nombre)}!!*+${Uri.encodeComponent(image)}');
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';}
}