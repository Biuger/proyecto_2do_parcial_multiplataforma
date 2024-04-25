import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_2do_parcial/src/models/Country.dart';


class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen>{
  late Future<List<Country>> _listadoPaises;

  Future<List<Country>> _getCountries() async {
    final Uri url = Uri.parse("https://restcountries.com/v3.1/all");

    final response = await http.get(url);
    List<Country> countries = [];

    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body) as List;
      for (var item in jsonData) {
        final name = item['name']['common'];
        final flagUrl = item['flags']['png'];
        final capital = item['capital'].toString();
        final region = item['region'].toString();
        final subregion = item['subregion'].toString();
        countries.add(Country(name, flagUrl, capital, region, subregion));
      }
      return countries;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoPaises = _getCountries();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Material App',
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
        body: FutureBuilder(
          future: _listadoPaises,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if(snapshot.hasError){
              return Text("Error");
            } else {
              final data = snapshot.data as List<Country>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final country = data[index];
                  return ListTile(
                    leading: Image.network(
                      country.flagUrl,
                      width: 100,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(country.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Capital: ${country.capital}"),
                        Text("Region: ${country.region}"),
                        Text("Subregion: ${country.subregion}"),
                      ],
                    ),
                  );
                },
              );
            }
          },
        )
      ),
    );
  }
}
