part of 'second_bloc.dart';

@immutable
abstract class SecondState {}

class SecondInitial extends SecondState {}

class SecondLoaded extends SecondState {
  final List<Item> items;

  SecondLoaded(this.items);
}
