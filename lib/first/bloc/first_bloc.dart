import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/first/model/item_user.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';

part 'first_event.dart';
part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  List<ItemUser> items = [];
  int _page = 0;

  @override
  FirstState get initialState => FirstInitial();

  @override
  Stream<FirstState> mapEventToState(
    FirstEvent event,
  ) async* {
    if (event is InitialFirst) {
      yield FirstInitial();
      for (int _i = 1; _i < 7; _i++) {
        _page = _i;
        await _fetch(_page);
        yield FirstLoaded(items);
      }
    }
    if (event is AddFirst) {
      await _fetch(++_page);
      yield FirstLoaded(items);
    }
  }

  Future _fetch(_page) async {
    final _client = BasicAuthClient('', '');
    final _response = await _client
        .get('https://jsonplaceholder.typicode.com/comments/$_page');
    final _result = itemUserFromJson(_response.body);
    items.add(_result);
  }
}
