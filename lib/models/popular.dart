class Popular {

    int id;
    String nombre;
    String detalles;
    int costo;
    String imagen;

    Popular({
        required this.id,
        required this.nombre,
        required this.detalles,
        required this.costo,
        required this.imagen,
    });

    factory Popular.fromJson(Map json)=> Popular(
      
      id: json["id"], 
      nombre: json["nombre"], 
      detalles: json["detalles"], 
      costo: json["costo"], 
      imagen: json["imagen"]
      ); 
}