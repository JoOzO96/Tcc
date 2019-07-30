import 'package:flutter/material.dart';
import 'package:unidb/ClinicalTrials.dart';
import 'package:unidb/consulta.dart';
import 'package:unidb/home.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Med+",
      debugShowCheckedModeBanner: false,
      home: new HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
            case '/consulta':
            return new MyCustomRoute(
              builder: (_) => new ConsultaScreen(),
              settings: settings,
            );
        }
        switch (settings.name) {
            case '/home':
            return new MyCustomRoute(
              builder: (_) => new HomeScreen(),
              settings: settings,
            );
        }
        switch (settings.name) {
            case '/clinicaltrialsscreen':
            return new MyCustomRoute(
              builder: (_) => new ClinicalTrialsScreen(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
