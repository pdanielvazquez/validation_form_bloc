import 'dart:async';

class Validators{

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ){
      if (password.length >= 6){
        sink.add(password);
      }
      else{
        sink.addError('La contraseña debe tener al menos 6 caracteres');
      }
    }
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ){
      
      // el correo requiere una validacion contra una expresion regular
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if( regExp.hasMatch( email )){
        sink.add( email );
      }
      else{
        sink.addError('formato de e-mail incorrecto');
      }

    }
  );

}