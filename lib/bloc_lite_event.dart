import 'package:equatable/equatable.dart';

abstract class BlocLiteEvent extends Equatable {
  BlocLiteEvent();
}

class LiteEvent extends BlocLiteEvent {}