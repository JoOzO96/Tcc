import 'package:flutter/material.dart';
import 'package:unidb/clinicalestudo.dart';
import 'package:unidb/consulta.dart';
import 'package:unidb/drugtargetscreen.dart';
import 'package:unidb/home.dart';
import 'package:unidb/pubmedabstract.dart';
import 'package:unidb/pubmedscreen.dart';

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
          case '/clinicalestudo':
            return new MyCustomRoute(
              builder: (_) => new ClinicalEstudoScreen(settings.arguments),
              settings: settings,
            );
        }switch (settings.name) {
          case '/drugtargetscreen':
            return new MyCustomRoute(
              builder: (_) => new DrugTargetScreen(settings.arguments),
              settings: settings,
            );
        }switch (settings.name) {
          case '/pubmedscreen':
            return new MyCustomRoute(
              builder: (_) => new PubMedScreen(settings.arguments),
              settings: settings,
            );
        }switch (settings.name) {
          case '/pubmedabstract':
            return new MyCustomRoute(
              builder: (_) => new PubMedAbstractScreen(settings.arguments),
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
