import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_example/second/model/item_post.dart';
import 'package:http_auth/http_auth.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  ItemPost _post;

  @override
  SecondState get initialState => SecondInitial();

  @override
  Stream<SecondState> mapEventToState(
    SecondEvent event,
  ) async* {
    if (event is LoadSecond) {
      yield SecondInitial();
      _post = await _fetch(event.id);
      yield SecondLoaded(_post);
    }
  }

  Future<ItemPost> _fetch(_id) async {
    final _client = BasicAuthClient('', '');
    final _response =
        await _client.get('https://jsonplaceholder.typicode.com/posts/$_id');
    return (itemPostFromJson(_response.body));
  }
}
