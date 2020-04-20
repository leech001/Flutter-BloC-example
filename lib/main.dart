import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'first_screen.dart';
import 'second/bloc/second_bloc.dart';
import 'second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SecondBloc>(
          create: (context) => SecondBloc()..add(InitialSecond()),
        ),
      ],
      child: MaterialApp(
        title: 'BloC example',
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => FirstScreen(), settings: routeSettings);
            case '/second':
              return MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                  settings: routeSettings);
              break;
            default:
              return MaterialPageRoute(
                  builder: (context) => FirstScreen(), settings: routeSettings);
              break;
          }
        },
      ),
    );
  }
}
