import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle= "Demo de Validación de Formulario";
    return MaterialApp(
              title: appTitle,
              home: Scaffold(
                      appBar: AppBar( title: Text(appTitle), ),
                      body: MyCustomForm(),
                    )
            );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> { 
  // Crea un clave global unívoco que identifica el widget Form
  //  y permite la validación del form
  //
  // Nota: esto es un 'GlobalKey<FormState>',
  // no un GlobalKey<MyCustomFormState>.
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Construye un Form widget usando el _formKey creado arriba.

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          TextFormField(
            // El validador recibe el texto que el usuario ha ingreado.
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor ingrese algún texto';
              }
              return null;
            },
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0),
              child: RaisedButton(
                         onPressed: (){
                                //Validate retorna verdadero si el form es válido, por el contrario dá falso.
                                if( _formKey.currentState.validate()) {
                                  // Si el form es válido, muestra el snackbar. En el mundo real,
                                  // no solés llamar al servidor o guardar la información en una base de datos.
                                  Scaffold
                                    .of(context)
                                    .showSnackBar(SnackBar(content: Text('Procesando los datos')));
                                }
                          },
                          child: Text('Enviar'),
                      ),
          ),
        ] )
    );
  }
}