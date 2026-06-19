import 'package:app_prueba1/screens/Pagina1.dart';
import 'package:app_prueba1/screens/Pagina2.dart';
import 'package:app_prueba1/screens/Pagina3.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Inicio"),
            onTap: () => Navigator.pop(context),
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
    );
  }
}