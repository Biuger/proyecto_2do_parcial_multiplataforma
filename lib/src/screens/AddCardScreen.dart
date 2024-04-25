import 'package:flutter/material.dart';
import 'package:proyecto_2do_parcial/src/screens/CardsScreen.dart';

class AddCardScreen extends StatefulWidget {
  final String username;
  AddCardScreen({required this.username});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  // Define los controladores dentro de la clase de estado
  final descripcionController = TextEditingController();
  final lugarController = TextEditingController();
  final imagenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "TECBOOK",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          backgroundColor: Color(0xFFDFEFF1),
          iconTheme: IconThemeData(color: Colors.blue),
          shape: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
        ),
        backgroundColor: Color(0xFFDFEFF1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Post(
                  username: widget.username,
                  descripcionController: descripcionController,
                  lugarController: lugarController,
                  imagenController: imagenController,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Color del botón
                  onPrimary: Colors.black, // Color del texto del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                    side: BorderSide(color: Colors.black), // Borde negro
                  ),
                ),
                onPressed: () {
                  // Obtener los valores de los TextField
                  String descripcion = descripcionController.text;
                  String lugar = lugarController.text;
                  String imagen = imagenController.text;

                  // Crear un objeto CardData con los valores ingresados
                  CardData nuevaCard = CardData(username: widget.username, descripcion: descripcion, lugar: lugar, imagen: imagen);

                  // Enviar los datos de regreso a la pantalla anterior
                  Navigator.pop(context, nuevaCard);
                },
                child: Icon(Icons.add, size: 30.0,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpia los controladores cuando el widget se desmonta
    descripcionController.dispose();
    lugarController.dispose();
    imagenController.dispose();
    super.dispose();
  }
}

class Post extends StatelessWidget {
  final String username;
  final TextEditingController descripcionController;
  final TextEditingController lugarController;
  final TextEditingController imagenController;

  Post({
    required this.username,
    required this.descripcionController,
    required this.lugarController,
    required this.imagenController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              'POST',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0),
          Text('NOMBRE:', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(username, style: TextStyle(color: Colors.blue)),
          SizedBox(height: 10.0),
          Text('DESCRIPCION:', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: descripcionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Text('LUGAR:', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: lugarController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Text('IMAGEN:', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: imagenController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
