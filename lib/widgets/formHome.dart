import 'package:flutter/material.dart';

class FormHome extends StatelessWidget {
  const FormHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Texto(texto: 'Codigo de reunión'),
          InputFormCs(),
          Texto(
            texto: 'Codigo de usuario',
            altura: 25,
          ),
          InputFormCs(),
          ButonEntrar()
        ],
      ),
    );
  }
}

class ButonEntrar extends StatelessWidget {
  const ButonEntrar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25,left: 30,right: 30),
          child: SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: (){},
              style:ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.white,
                maximumSize: const Size(300, 60),
                textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
              ),
              child: const Text('Ingresar a la reunión'),
            ),
          ),
        ),
      ],
    );
  }
}

class InputFormCs extends StatelessWidget {
  const InputFormCs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    );
  }
}

class Texto extends StatelessWidget {
  const Texto({
    Key? key,
    required this.texto,
    this.altura = 0,
  }) : super(key: key);

  final String texto;
  final double? altura;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: altura != 0
          ? EdgeInsets.only(left: 30, right: 30, top: altura!)
          : const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        texto,
        style: estiloLetas(context),
      ),
    );
  }
}

TextStyle estiloLetas(BuildContext context) => TextStyle(
    color: Theme.of(context).primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: 'Inter');
