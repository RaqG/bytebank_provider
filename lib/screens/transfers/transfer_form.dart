import 'package:bytebank_provider/components/editor.dart';
import 'package:bytebank_provider/models/balance.dart';
import 'package:bytebank_provider/models/transfer.dart';
import 'package:bytebank_provider/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Criando Transferência';

const _labelValue = 'Valor';
const _hintValue = '0.00';

const _labelAccountNumber = 'Número da conta';
const _hintAccountNumber = '0000';

const _confirmButtonTxt = 'Confirmar';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
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
                controller: _controllerAccountNumber,
                hintText: _hintAccountNumber,
                labelText: _labelAccountNumber,
                textInputType: TextInputType.number,
              ),
              Editor(
                hintText: _hintValue,
                controller: _controllerValue,
                labelText: _labelValue,
                icon: Icons.monetization_on,
                textInputType: TextInputType.number,
              ),
              RaisedButton(
                child: Text(_confirmButtonTxt),
                onPressed: () => createTransfer(context),
              ),
            ],
          ),
        ));
  }

  void createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double value = double.tryParse(_controllerValue.text);
    if (validateTransfer(context, accountNumber, value)) {
      updateTransfer(context, Transfer(accountNumber, value));
      Navigator.pop(context);
    }
  }

  bool validateTransfer(context, accountNumber, value) {
    final hasBalance = value <= Provider.of<Balance>(context, listen: false).value;
    return accountNumber != null && value != null && hasBalance;
  }

  void updateTransfer(context, Transfer transfer) {
    Provider.of<Transfers>(context, listen: false).add(transfer);
    Provider.of<Balance>(context, listen: false).subtract(transfer.value);
  }
}
