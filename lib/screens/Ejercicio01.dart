import "package:flutter/material.dart";

void main(){
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
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
        title: const Text(''),
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
        Campo2(context),
        Boton(context)
      ],
    ),
  );
}

Widget Titulo() {
  return Text("IMC");
}

final TextEditingController _altura=TextEditingController();
Widget Campo(context){
  return(
    TextField(
      controller: _altura,
      decoration: InputDecoration(
        hintText: "Ingrese su altura (Metros)"
      ),
    )
  );
}
final TextEditingController _peso=TextEditingController();
Widget Campo2(context){
  return(
    TextField(
      controller: _peso,
      decoration: InputDecoration(
        hintText: "Ingrese su peso (Kilogramos)"
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
  double altura = double.tryParse(_altura.text)?? 0.0;
  double peso = double.tryParse(_peso.text)?? 0.0;
  double calculo= peso/(altura*altura);
  return calculo;
}

void alerta(context){
  showDialog(context: context, builder: (context){
    return(
      AlertDialog(
        title: Text("Respuesta"),
        content: Text("Tu nivel de masa es ${calcular()}"),
      )
    );
  });
}