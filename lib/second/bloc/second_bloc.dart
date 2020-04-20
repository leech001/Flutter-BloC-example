import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/second/model/items.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  List<Item> items = [];
  int _page = 0;

  @override
  SecondState get initialState => SecondInitial();

  @override
  Stream<SecondState> mapEventToState(
    SecondEvent event,
  ) async* {
    if (event is InitialSecond) {
      yield SecondInitial();
      for (int _i = 1; _i < 10; _i++) {
        _page = _i;
        await _fetch(_page);
        yield SecondLoaded(items);
      }
    }
    if (event is AddSecond) {
      await _fetch(++_page);
      yield SecondLoaded(items);
    }
  }

  Future _fetch(_page) async {
    final _client = BasicAuthClient('', '');
    final _response =
        await _client.get('https://jsonplaceholder.typicode.com/todos/$_page');
    final _result = itemFromJson(_response.body);
    items.add(_result);
  }
}
