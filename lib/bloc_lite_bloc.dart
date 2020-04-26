import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import 'package:bloc/bloc.dart';
import './bloc.dart';

class BlocLiteBloc extends Bloc<BlocLiteEvent, BlocLiteState> {
  FirebaseDatabase database = FirebaseDatabase();
  DatabaseReference _locationsRef =
      FirebaseDatabase.instance.reference().child("Locations");
  StreamSubscription<Event> _onValueSubscription;
  StreamSubscription<Event> _onChildAddedSubscription;
  StreamSubscription<Event> _onChildChangedSubscription;

  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;

  @override
  Future<void> close() async {
    super.close();
    _onValueSubscription?.cancel();
    _onChildAddedSubscription?.cancel();
    _onChildChangedSubscription?.cancel();
  }

  @override
  BlocLiteState get initialState => InitialBlocLiteState();

  @override
  Stream<BlocLiteState> mapEventToState(
    BlocLiteEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LiteEvent) {
      _onValueSubscription?.cancel();
      _onChildAddedSubscription?.cancel();
      _onChildChangedSubscription?.cancel();

      _onValueSubscription = _locationsRef.onValue.listen((Event event) async* {
        print("_onValueSubscription triggered");
        print(event.snapshot.value);
        _counter1++;
//        yield LoadedBlocLiteState(
//            counter1: _counter1, counter2: _counter2, counter3: _counter3);
      });
      _onChildAddedSubscription =
          _locationsRef.onChildAdded.listen((Event event) async* {
        print("_onChildAddedSubscription triggered");
        print(event.snapshot.value);
        _counter2++;
//        yield LoadedBlocLiteState(
//            counter1: _counter1, counter2: _counter2, counter3: _counter3);
      });
      _onChildChangedSubscription =
          _locationsRef.onChildChanged.listen((Event event) async* {
        print("_onChildChangedSubscription triggered");
        print(event.snapshot.value);
        _counter3++;
//        yield LoadedBlocLiteState(
//            counter1: _counter1, counter2: _counter2, counter3: _counter3);
      });

      yield LoadedBlocLiteState(
          counter1: _counter1, counter2: _counter2, counter3: _counter3);
    }
  }
}
