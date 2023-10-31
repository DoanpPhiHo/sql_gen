import 'package:db_sql_query/db_sql_query.dart';
import 'package:example/models/track.dart';

import 'invoice.dart';

part 'invoice_item.g.dart';

@ModelSql()
class InvoiceItem extends ITable {
  @primaryKeyAuto
  final int id;
  @ForeignKey(name: 'invoiceId')
  final Invoice? invoice;
  @ForeignKey(name: 'trackId')
  final Track? track;
  @column
  final int unitPrice;
  @column
  final int quantity;

  InvoiceItem({
    this.id = 0,
    this.invoice,
    required this.quantity,
    this.track,
    required this.unitPrice,
  });

  factory InvoiceItem.fromJsonDB(Map<String, dynamic> json) =>
      $InvoiceItemFromJsonDB(json);
}
