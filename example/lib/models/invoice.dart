import 'package:db_sql_query/db_sql_query.dart';

part 'invoice.g.dart';

@ModelSql()
class Invoice extends ITable {
  @primaryKeyAuto
  final int id;
  @index
  final int customerId;
  @column
  final int invoiceDate;
  @column
  final String billingAddress;
  @column
  final String? billingState;
  @column
  final String? billingPostalCode;
  @column
  final String billingCountry;
  @column
  final String billingCity;
  @column
  final double total;

  Invoice({
    this.id = 0,
    this.billingState,
    this.billingPostalCode,
    required this.billingAddress,
    required this.billingCountry,
    required this.billingCity,
    required this.customerId,
    required this.invoiceDate,
    required this.total,
  });

  factory Invoice.fromJsonDB(Map<String, dynamic> json) =>
      $InvoiceFromJsonDB(json);
}
