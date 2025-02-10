import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  TextEditingController counterText = TextEditingController();
  int counter = 0;
  final estiloTexto = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contador de clicks'),
      ),
      body: Center(
        child: contenido(),
      ),
      floatingActionButton: botones(counter),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void decrementar() {
    counter++;
    counterText.text = counter.toString();
    // print('presionaste el boton -1');
    // print(counter);
    setState(() {
      // setState este ase los cambios
    });
  }

  void reiniciar() {
    counter = 0;
    counterText.text = counter.toString();
    // print('presionaste el boton -1');
    // print(counter);
    setState(() {
      // setState este ase los cambios
    });
  }

  void incrementar() {
    counter--;
    counterText.text = counter.toString();
    // print('presionaste el boton -1');
    // print(counter);
    setState(() {
      // setState este ase los cambios
    });
  }

  Column contenido() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        espacio(80.0),
        Text('Numero de Taps: ', style: estiloTexto),
        espacio(50.0),
        conteo(),
        espacio(50.0),
        Text(
          'desarrollador',
          style: estiloTexto,
        ),
        Text(
          'Alan López Romero',
          style: estiloTexto,
        ),
        espacio(20),
      ],
    );
  }

  SizedBox conteo() {
    return SizedBox(
      width: 250.0,
      child: TextField(
        onChanged: (value) {
          counter = int.parse(value);
        },
        enabled: true,
        controller: counterText,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        maxLength:
            5, //este es para poner limite de caracteres al ora de que escriba el ususario
        textAlign: TextAlign.center,
        // keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            labelText: 'taps',
            hintText:
                'Escribe un numero', //este es para poner un texto que le indique al usuario que deve de aser
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 65, 67, 70),
            ),
            // prefix: Icon(Icons.numbers_outlined), //poner iconos
            // prefixIcon: Icon(Icons.account_circle),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 4.0,
                ))
            //labelText: 'Escribe numero', //poner texto en el border de la caja
            //helperText:'Aqui debes escribir un numero', //poner un text debajo de la caja
            ),
      ),
    );
  }

  SizedBox espacio(double alto) {
    return SizedBox(
      height: alto,
    );
  }

  Row botones(int counter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: incrementar,
          foregroundColor: CupertinoColors.activeGreen,
          backgroundColor: Colors.black54,
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          onPressed: reiniciar,
          foregroundColor: CupertinoColors.activeGreen,
          backgroundColor: Colors.black54,
          child: Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: decrementar,
          foregroundColor: CupertinoColors.activeGreen,
          backgroundColor: Colors.black54,
          child: Icon(Icons.exposure_plus_1),
        ),
      ],
    );
  }
}
