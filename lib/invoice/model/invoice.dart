import 'package:ecommerce/invoice/model/supplier.dart';

import 'customer.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final String date;
  final String dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String description;
  final String date;
  final int quantity;
  final String vat;
  final int unitPrice;
  final int total;

  const InvoiceItem({
    required this.description,
    required this.total,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}
