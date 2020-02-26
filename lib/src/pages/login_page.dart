import 'package:flutter/material.dart';
import 'package:validacion_form/src/blocs/provider2.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // Primero es un return y luego se cambia a almacenar en un objeto
    final fondoMorado = Container(
      height: size.height*0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ]),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned( child: circulo, top: 90.0, left: 30.0, ),
        Positioned( child: circulo, top: -40.0, left: -30.0, ),
        Positioned( child: circulo, top: 200.0, left: 230.0, ),
        Positioned( child: circulo, top: -20.0, left: size.width - 100, ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
              SizedBox(height: 10.0, width: double.infinity,),
              Text('Mtro. Paulo Daniel Vázquez Mora', style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    // Se añade para escuchar el estado de los inputs
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            margin: EdgeInsets.symmetric( vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(1.0, 5.0),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Inicio de sesión', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 30.0,),
                _crearEmail(bloc),
                SizedBox(height: 30.0,),
                _crearPassword(bloc),
                SizedBox(height: 30.0,),
                _crearBoton(bloc),
              ],
            ),
          ),
          Text('¿Olvidó la contraseña?'),
          SizedBox(height: 100.0,),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc?.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: ( value ) => bloc?.changeEmail( value ),
          ),
          padding: EdgeInsets.symmetric( horizontal: 20.0),
        );
      },
    );

  }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc?.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc?.changePassword,
          ),
          padding: EdgeInsets.symmetric( horizontal: 20.0),
        );
      },
    );

  }

  Widget _crearBoton(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc?.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 20.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
        );
      },
    );
  }

  void _login(LoginBloc bloc, BuildContext context){
    print('--------------------------');
    print('Email: ${bloc.email}');
    print('Contraseña: ${bloc.password}');
    Navigator.pushReplacementNamed(context, 'home');
  }

}