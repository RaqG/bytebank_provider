import 'package:bytebank_provider/screens/balance_card.dart';
import 'package:bytebank_provider/screens/deposit/deposit_form.dart';
import 'package:bytebank_provider/screens/transfers/last_transfers.dart';
import 'package:bytebank_provider/screens/transfers/transfer_form.dart';
import 'package:flutter/material.dart';

const String _titleAppBar = 'Bytebank';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DepositForm()));
                },
                child: Text('Receber depósito'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TransferForm()));
                },
                child: Text('Nova transferência'),
              ),
            ],
          ),
          LastTransfers(),
        ],
      ),
    );
  }
}
