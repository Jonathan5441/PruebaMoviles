import 'package:flutter/material.dart';
import 'package:prueba1/screens/Ejercicio01.dart';
import 'package:prueba1/screens/Ejercicio02.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      home: Home(),
      routes: {'/Ejercicio02': (context) => Ejercicio02()},
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int indice =0;
  @override
  Widget build(BuildContext context) {
    List <Widget> screens = [Cuerpo(context), Ejercicio01()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap:(valor){
          setState(() {
            indice=valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Prueba'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center),label: 'Ejercicio01')
        ],
      ),
    );
  }
}

Widget Cuerpo(context) {
  return 
  Center(
    child: Column(
      
      children: <Widget>[
        Titulo(),
        Boton(context),
      ],
    ),
  );
}

Widget Titulo() {
  return Text("Nombre: Jonathan Carrasco, Github: Jonathan5441");
}

Widget Boton(context) {
  return ElevatedButton(
    onPressed: () {
      mostrarAlerta(context);
    },
    child: const Text('Ir a la ventana 2'),
  );
}

void mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Mensaje'),
        content: Text('¿Deseas ir al Ejercicio02?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Ejercicio02');
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    },
  );
}
