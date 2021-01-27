import 'package:bytebank_provider/components/transfer_item.dart';
import 'package:bytebank_provider/models/transfers.dart';
import 'package:bytebank_provider/screens/transfers/empty_list.dart';
import 'package:bytebank_provider/screens/transfers/transfer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _lastTransfersTitle = 'Últimas transferências';
const String _buttonText = 'Todas as transferências';

class LastTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _lastTransfersTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transfers>(builder: (context, transferList, child) {
          final lastTransfers = transferList.transfers.reversed.toList();
          final int quantity = lastTransfers.length;
          int length = 2;
          if (quantity == 0) return EmptyTransfers();
          if (quantity < 2) length = quantity;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: length,
            itemBuilder: (context, index) {
              return TransferItem(lastTransfers[index]);
            },
          );
        }),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransferList()));
          },
          child: Text(_buttonText),
        ),
      ],
    );
  }
}
