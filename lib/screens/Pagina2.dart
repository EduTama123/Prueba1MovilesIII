import 'package:app_prueba1/navigations/Navegador.dart';
import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController salarioController = TextEditingController();
    final TextEditingController paisController = TextEditingController();
    String resultado = "";

    return Scaffold(
      appBar: AppBar(title: const Text("Salario Neto")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                controller: salarioController,
                decoration: const InputDecoration(
                  labelText: "Salario bruto",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: TextField(
                controller: paisController,
                decoration: const InputDecoration(
                  labelText: "País (España, México, Argentina, Colombia)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double salarioBruto = double.parse(salarioController.text);
                String pais = paisController.text.toLowerCase();

                double impuesto = 0;

                if (pais == "españa") {
                  impuesto = 0.21;
                } else if (pais == "mexico") {
                  impuesto = 0.30;
                } else if (pais == "argentina") {
                  impuesto = 0.35;
                } else if (pais == "colombia") {
                  impuesto = 0.19;
                } else {
                  resultado = "Error: País no válido";
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(resultado),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cerrar"),
                        ),
                      ],
                    ),
                  );
                  return;
                }

                double descuento = salarioBruto * impuesto;
                double salarioNeto = salarioBruto - descuento;

                resultado = "Salario Neto: \$${salarioNeto.toStringAsFixed(2)}\n"
                    "Monto descontado: \$${descuento.toStringAsFixed(2)}";

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