import 'dart:async';
import 'package:validacion_form/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

// en primera instancia no se agrega el mix - with

class LoginBloc with Validators {

  // Deshabilitado una vez que se agregó la nueva libreria rxdart
  /*
  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  */

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del stream

  //Stream<String> get emailStream     => _emailController.stream;
  Stream<String> get emailStream     => _emailController.stream.transform(validarEmail);
  //Stream<String> get passwordStream  => _passwordController.stream;
  Stream<String> get passwordStream  => _passwordController.stream.transform(validarPassword);


  // Creando nuevo stream una vez agregado rxdart

  Stream<bool> get formValidStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);
  // Insertar valores al stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener los ultimos valores de los input, Despues de validar

  String get email => _emailController.value;
  String get password => _passwordController.value;

  // Destruyendo los controllers

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
  // el ? evita cerrar cuando no existe 
}