// To parse this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);


class Product {

    int id;
    String nombre;
    String detalles;
    String costo;
    String imagen;

    Product({
        required this.id,
        required this.nombre,
        required this.detalles,
        required this.costo,
        required this.imagen,
    });

    factory Product.fromJson(Map json)=> Product(
      id: json["id"], 
      nombre: json["nombre"], 
      detalles: json["detalles"], 
      costo: json["costo"], 
      imagen: json["imagen"]
      ); 
}
