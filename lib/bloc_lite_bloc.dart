import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlocLiteBloc extends Bloc<BlocLiteEvent, BlocLiteState> {
  @override
  BlocLiteState get initialState => InitialBlocLiteState();

  @override
  Stream<BlocLiteState> mapEventToState(
    BlocLiteEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
