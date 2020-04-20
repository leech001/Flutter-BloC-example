import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'second/bloc/second_bloc.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Container(
        child: BlocBuilder<SecondBloc, SecondState>(builder: (context, state) {
          if (state is SecondInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SecondLoaded) {
            return _info(state);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  _info(state) {
    return Column(children: <Widget>[
      Text('Идентификатор:  ${state.item.id}'),
      Text('Заголовок:  ${state.item.title}'),
      Text('Сообщение:  ${state.item.body}'),
    ]);
  }
}
