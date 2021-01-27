import 'package:bytebank_provider/models/balance.dart';
import 'package:bytebank_provider/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/transfers.dart';

void main() {
  runApp(
    MultiProvider(
      child: BytebankApp(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => Balance(0),
          child: BytebankApp(),
        ),
        ChangeNotifierProvider(
          create: (context) => Transfers(),
          child: BytebankApp(),
        ),
      ],
    ),
  );
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[500],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
