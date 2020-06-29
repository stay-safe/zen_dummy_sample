import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
//import 'package:zen_dummy/bloc.dart';

abstract class BlocLiteState extends Equatable {
  BlocLiteState();
}

class InitialBlocLiteState extends BlocLiteState {
  @override
  List<Object> get props => [];
}
class LoadedBlocLiteState extends BlocLiteState {
  final int counter1;
  final int counter2;
  final int counter3;

  LoadedBlocLiteState({
    @required this.counter1,
    @required this.counter2,
    @required this.counter3,
  });

  @override
  List<Object> get props => [counter1, counter2, counter3];
}
