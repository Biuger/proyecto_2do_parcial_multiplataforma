import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proyecto_2do_parcial/src/bloc/validators.dart';

class Bloc with Validators {
  final _userController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get user =>
      _userController.stream.transform(validaUser);
  Stream<String> get password =>
      _passwordController.stream.transform(validaPassword);

  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _userController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
