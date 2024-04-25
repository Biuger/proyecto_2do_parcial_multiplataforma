import 'package:flutter/material.dart';
import 'package:proyecto_2do_parcial/src/bloc/bloc.dart'; // Importa tu clase Bloc
import 'package:proyecto_2do_parcial/src/bloc/validators.dart';
import 'package:proyecto_2do_parcial/src/screens/CardsScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final bloc = Bloc(); // Crea una instancia de tu clase Bloc

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  Text(
                    'WELCOME A TECBOOK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 140.0),
                  Text(
                    'LOGIN:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 52, 39, 39),
                    ),
                  ),
                  SizedBox(height: 28.0),
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    color: Color(0xFFE3DDF3),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildTextFieldWithLabel(
                            label: 'USER:',
                            obscureText: false,
                            controller: userController,
                            stream: bloc.user,
                            onChanged: bloc.changeUser,
                          ),
                          SizedBox(height: 10.0),
                          _buildTextFieldWithLabel(
                            label: 'PASSWORD:',
                            obscureText: true,
                            controller: passController,
                            stream: bloc.password,
                            onChanged: bloc.changePassword,
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(height: 25.0),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Color(0xFFE7F1DD),
                              side: BorderSide(color: Colors.black, width: 2.0),
                            ),
                            onPressed: () {
                              if (userController.text == "Lucía" &&
                                  passController.text == "Lucy123") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } else if (userController.text == "Angel" &&
                                  passController.text == "angel123") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } else if (userController.text == "fluttershy" &&
                                  passController.text == "aleteo123") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardsScreen(
                                        username: userController.text),
                                  ),
                                );
                              } 
                              else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          "usuario o contraseña incorrectos"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cerrar"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text("ENTRAR"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required bool obscureText,
    TextEditingController? controller,
    required Stream<String> stream,
    required Function(String) onChanged,
  }) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: onChanged,
                obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  errorText:
                      snapshot.error == null ? null : snapshot.error.toString(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
