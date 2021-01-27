import 'package:bytebank_provider/components/editor.dart';
import 'package:bytebank_provider/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Depósito';

const _labelValue = 'Valor';
const _hintValue = '0.00';

const _confirmButtonTxt = 'Confirmar';

class DepositForm extends StatefulWidget {
  @override
  _DepositFormState createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm> {
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                hintText: _hintValue,
                controller: _controllerValue,
                labelText: _labelValue,
                icon: Icons.monetization_on,
                textInputType: TextInputType.number,
              ),
              RaisedButton(
                child: Text(_confirmButtonTxt),
                onPressed: () => createDeposit(context),
              ),
            ],
          ),
        ));
  }

  createDeposit(BuildContext context) {
    final double value = double.tryParse(_controllerValue.text);
    if (verifyDeposit(value)) {
      updateDeposit(value);
      Navigator.pop(context);
    }
  }

  bool verifyDeposit(value) {
    return value != null;
  }

  void updateDeposit(double value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
