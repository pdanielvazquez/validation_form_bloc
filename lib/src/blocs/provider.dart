import 'package:flutter/material.dart';
import 'package:validacion_form/src/blocs/login_bloc.dart';
export 'package:validacion_form/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget {

  /*
  const Provider({
    Key key,
    @required this.loginBloc,
    @required Widget child,
  }) : assert(loginBloc != null),
       assert(child != null),
       super(key: key, child: child);
  */
  Provider({Key key, Widget child, this.loginBloc}):
    super(key: key, child: child);

  final LoginBloc loginBloc;

  static LoginBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  @override
  bool updateShouldNotify(Provider old) => loginBloc != old.loginBloc;
}