import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = const MovieBlocObserver();
  runApp(App());
}
