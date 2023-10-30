import 'package:db_sql_query/db_sql_query.dart';

part 'invoice_item.g.dart';

@ModelSql()
class InvoiceItem extends ITable {
  @primaryKeyAuto
  final int id;
  @index
  final int invoiceId;
  @index
  final int trackId;
  @column
  final int unitPrice;
  @column
  final int quantity;

  InvoiceItem({
    this.id = 0,
    required this.invoiceId,
    required this.quantity,
    required this.trackId,
    required this.unitPrice,
  });

  factory InvoiceItem.fromJsonDB(Map<String, dynamic> json) =>
      $InvoiceItemFromJsonDB(json);
}
