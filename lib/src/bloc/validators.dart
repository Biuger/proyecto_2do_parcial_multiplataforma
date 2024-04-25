import 'dart:async';

mixin Validators{
  final validaUser =
   StreamTransformer<String, String>
    .fromHandlers(
    handleData: (user, sink){
    if(user.length > 2){
      sink.add(user);
    }
    else{
      sink.addError('usuario no válido');
    }
  }
  );

  final validaPassword =
   StreamTransformer<String, String>
    .fromHandlers(
    handleData: (password, sink){
    if(password.length > 5){
      sink.add(password);
    }
    else{
      sink.addError('password invalido');
    }
  }
  );
}