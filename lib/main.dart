import 'package:app_prueba1/screens/Pagina1.dart';
import 'package:app_prueba1/screens/Pagina2.dart';
import 'package:app_prueba1/screens/Pagina3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NavegadorDrawer());
}

class NavegadorDrawer extends StatelessWidget {
  const NavegadorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba 1"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Información"),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Título: Ejercicios de Programación"),
                      Text("Programador: Eduardo Tamayo"),
                      Text("Carrera: Desarrollo de Software"),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cerrar"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/data/imgfondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            "Selecciona una opción del menú",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Inicio"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavegadorDrawer()),
              ),
            ),
            ListTile(
              title: const Text("Pregunta 1: Combustible"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pagina1()),
              ),
            ),
            ListTile(
              title: const Text("Pregunta 2: Salario Neto"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pagina2()),
              ),
            ),
            ListTile(
              title: const Text("Pregunta 3: Lista de Platillos"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pagina3()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}