part of 'first_bloc.dart';

@immutable
abstract class FirstState {}

class FirstInitial extends FirstState {}

class FirstLoaded extends FirstState {
  final List<ItemUser> items;

  FirstLoaded(this.items);
}
