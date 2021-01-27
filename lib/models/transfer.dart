import 'package:flutter/material.dart';

class Transfer {
  final int accountNumber;
  final double value;

  Transfer(this.accountNumber, this.value);

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccount() {
    return 'Conta: $accountNumber';
  }
}
