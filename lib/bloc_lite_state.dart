import 'package:equatable/equatable.dart';

abstract class BlocLiteState extends Equatable {
  BlocLiteState();
}

class InitialBlocLiteState extends BlocLiteState {
  @override
  List<Object> get props => [];
}
