import "package:flutter/material.dart";

void main(){
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context) {
  return Center(
    child: Column(
      children: <Widget>[
        Titulo(),
        Campo(context),
        Boton(context)

      ],
    ),
  );
}

Widget Titulo() {
  return Text("Calculo de distancia");
}

final TextEditingController _velocidad=TextEditingController();
Widget Campo(context){
  return(
    TextField(
      controller: _velocidad,
      decoration: InputDecoration(
        hintText: "Ingrese la velocidad"
      ),
    )
  );
}

Widget Boton(context){
  return(
    ElevatedButton(onPressed: () {
      alerta(context);
    },child: Text('Calcular'),)
  );
}

double calcular(){
  double velocidad = double.tryParse(_velocidad.text)?? 0.0;
  double tiempo = 100;
  double calculo= velocidad*tiempo;
  return calculo;
}

void alerta(context){
  showDialog(context: context, builder: (context){
    return(
      AlertDialog(
        title: Text("Respuesta"),
        content: Text("La distancia recorrida es ${calcular()}"),
      )
    );
  });
}