import 'package:flutter/material.dart';

class EmptyTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Não há transferências realizadas.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
