import 'dart:convert';
import 'package:app_prueba1/navigations/Navegador.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Platillos")),
      body: FutureBuilder( future: leer(), builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder( itemCount: data.length, itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  child: ListTile(
                    onTap: () => verDetalles(context, item),
                    leading: Image.network(
                      item['imagen'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(item['nombre']),
                    subtitle: Text(
                      "Región: ${item['region']}\nPrecio: \$${item['precio']['real']}",
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: MiDrawer(),
    );
  }

  //leer json externo
  Future<List> leer() async {
    final respuesta = await http.get(
      Uri.parse("https://jritsqmet.github.io/web-api/menu2.json"),
    );
    return json.decode(respuesta.body)['platillos'];
  }

  //funcion para ver detalle de comida
  void verDetalles(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item['nombre']),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Región: ${item['region']}"),
              Text("Precio: \$${item['precio']['real']}"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }
}
