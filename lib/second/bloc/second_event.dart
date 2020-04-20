part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {}

class InitialSecond extends SecondEvent {}

class LoadSecond extends SecondEvent {
  final int id;

  LoadSecond(this.id);
}
