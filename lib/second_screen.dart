import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'second/bloc/second_bloc.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: BlocBuilder<SecondBloc, SecondState>(builder: (context, state) {
        if (state is SecondInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SecondLoaded) {
          return _listView(context, state);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  _listView(context, state) {
    final SecondBloc _bloc = BlocProvider.of<SecondBloc>(context);
    return LazyLoadScrollView(
      onEndOfPage: () {
        _bloc.add(AddSecond());
      },
      child: ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, i) {
            return _itemsElement(state.items[i]);
          }),
    );
  }

  _itemsElement(element) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Container(
        child: ListTile(
          title: Text(element.userId.toString()),
          subtitle: Text(element.title.toString()),
          leading: CircleAvatar(child: Text(element.id.toString())),
        ),
      ),
    );
  }
}
