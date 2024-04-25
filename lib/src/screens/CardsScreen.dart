import 'package:flutter/material.dart';
import 'package:proyecto_2do_parcial/src/screens/AddCardScreen.dart';
import 'package:proyecto_2do_parcial/src/screens/ApiScreen.dart';


class CardData {
  final String username;
  final String descripcion;
  final String lugar;
  final String imagen;

  CardData(
      {required this.username,
      required this.descripcion,
      required this.lugar,
      required this.imagen});
}

class CardsScreen extends StatefulWidget {
  final String username;
  CardsScreen({required this.username});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  // Lista de datos de tarjetas
  final List<CardData> cardDataList = [];

  // Función para eliminar una tarjeta de la lista
  void eliminarTarjeta(int index) {
    setState(() {
      cardDataList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TECBOOK',
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
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cardDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget(
                  nombre: cardDataList[index].username,
                  descripcion: cardDataList[index].descripcion,
                  lugar: cardDataList[index].lugar,
                  imagen: cardDataList[index].imagen,
                  onDelete: () {
                    eliminarTarjeta(index);
                  },
                );
              },
            ),
            Positioned(
              top: 1.0,
              right: 20.0,
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 40.0, // Tamaño del ícono
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCardScreen(username: widget.username)),
                  ).then((nuevaCard) {
                    // Verificar si se recibieron nuevos datos
                    if (nuevaCard != null) {
                      setState(() {
                        cardDataList.add(nuevaCard);
                      });
                    }
                  });
                },
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ApiScreen()),
                      );
                    },
                    child: Text("API"),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String lugar;
  final String imagen;
  final Function onDelete;

  CardWidget({
    required this.nombre,
    required this.descripcion,
    required this.lugar,
    required this.imagen,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 50.0, left: 25.0, right: 25.0), // Padding entre los Cards
      child: Card(
        color: Color(0xFFF6D8EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black, width: 2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding dentro del Card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Contenedor de imagen
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.network(
                      imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Modificaciones aquí
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 50.0),
                          child: Text(
                            nombre,
                            style: TextStyle(
                              color:Color(0xFF4E72CB), // Cambiar color a azul
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 50.0),
                          child: Text(
                            descripcion,
                            style: TextStyle(
                              color: Colors.black, // Cambiar color a azul
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 50.0),
                          child: Text(
                            lugar,
                            style: TextStyle(
                              color: Colors.black, // Cambiar color a azul
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    onDelete(); // Llama a la función para eliminar la tarjeta
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
