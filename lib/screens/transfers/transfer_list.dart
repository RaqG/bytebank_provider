import 'package:bytebank_provider/components/transfer_item.dart';
import 'package:bytebank_provider/models/transfers.dart';
import 'package:bytebank_provider/screens/transfers/empty_list.dart';
import 'package:bytebank_provider/screens/transfers/transfer_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Transferências';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Consumer<Transfers>(
        builder: (context, transferList, child) {
          return (transferList.transfers.length == 0)
              ? Center(child: EmptyTransfers())
              : ListView.builder(
                  itemCount: transferList.transfers.length,
                  itemBuilder: (context, index) {
                    final transfer = transferList.transfers[index];
                    return TransferItem(transfer);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TransferForm();
              },
            ),
          );
        },
      ),
    );
  }
}
