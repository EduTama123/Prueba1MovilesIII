import 'package:app_prueba1/navigations/Navegador.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController distanciaController = TextEditingController();
    final TextEditingController precioController = TextEditingController();
    final TextEditingController eficienciaController = TextEditingController();
    String resultado = "";

    return Scaffold(
      appBar: AppBar(title: const Text("Costo de Combustible")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                controller: distanciaController,
                decoration: const InputDecoration(
                  labelText: "Distancia del viaje (km)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: "Precio por litro de combustible",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: TextField(
                controller: eficienciaController,
                decoration: const InputDecoration(
                  labelText: "Eficiencia del auto (km/litro)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double distancia = double.parse(distanciaController.text);
                double precio = double.parse(precioController.text);
                double eficiencia = double.parse(eficienciaController.text);

                if (eficiencia > 0) {
                  double litros = distancia / eficiencia;
                  double costoTotal = litros * precio;
                  resultado = "Costo total: ${costoTotal}";
                } else {
                  resultado = "Error: La eficiencia debe ser mayor a 0";
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Resultado"),
                    content: Text(resultado),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cerrar"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}