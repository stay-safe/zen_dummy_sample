//import 'package:equatable/equatable.dart';

abstract class BlocLiteEvent {
  BlocLiteEvent();

}

class LiteTriggerEvent extends BlocLiteEvent {}

class LiteYieldEvent extends BlocLiteEvent {}