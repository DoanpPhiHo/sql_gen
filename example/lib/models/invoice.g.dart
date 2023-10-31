// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension InvoiceQuery on Invoice {
  static const IColumn<Invoice> invoiceId =
      _InvoiceId('id', tableName: 'invoice');

  static const IColumn<Invoice> invoiceInvoiceDate =
      _InvoiceInvoiceDate('invoiceDate', tableName: 'invoice');

  static const IColumn<Invoice> invoiceBillingAddress =
      _InvoiceBillingAddress('billingAddress', tableName: 'invoice');

  static const IColumn<Invoice> invoiceBillingState =
      _InvoiceBillingState('billingState', tableName: 'invoice');

  static const IColumn<Invoice> invoiceBillingPostalCode =
      _InvoiceBillingPostalCode('billingPostalCode', tableName: 'invoice');

  static const IColumn<Invoice> invoiceBillingCountry =
      _InvoiceBillingCountry('billingCountry', tableName: 'invoice');

  static const IColumn<Invoice> invoiceBillingCity =
      _InvoiceBillingCity('billingCity', tableName: 'invoice');

  static const IColumn<Invoice> invoiceTotal =
      _InvoiceTotal('total', tableName: 'invoice');

  static const IColumn<Invoice> invoiceCustomer =
      _InvoiceCustomer('customerId', tableName: 'invoice');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'invoiceDate': invoiceDate,
        'billingAddress': billingAddress,
        'billingState': billingState,
        'billingPostalCode': billingPostalCode,
        'billingCountry': billingCountry,
        'billingCity': billingCity,
        'total': total,
        'customerId': customer?.id
      };
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL',
          'invoiceDate INTEGER NOT NULL',
          'billingAddress TEXT NOT NULL',
          'billingState TEXT',
          'billingPostalCode TEXT',
          'billingCountry TEXT NOT NULL',
          'billingCity TEXT NOT NULL',
          'total REAL NOT NULL',
          'customerId INTEGER',
          'FOREIGN KEY (customerId) REFERENCES customer (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
        ],
      );
  static String get name => 'invoice';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Invoice, IColumn<Invoice>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(invoiceId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Invoice, IColumn<Invoice>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(invoiceId, id),
      );
  static Future<Invoice?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Invoice, IColumn<Invoice>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(invoiceId, id),
        parser: (e) => Invoice.fromJsonDB(e),
      );
  static Future<Invoice?> findOne() => ExtraQuery.instance.findOne<Invoice>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Invoice.fromJsonDB(e),
      );
  static Future<List<Invoice>> find() => ExtraQuery.instance.find<Invoice>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Invoice.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          InvoiceQuery.invoiceInvoiceDate.str,
          InvoiceQuery.invoiceBillingAddress.str,
          InvoiceQuery.invoiceBillingState.str,
          InvoiceQuery.invoiceBillingPostalCode.str,
          InvoiceQuery.invoiceBillingCountry.str,
          InvoiceQuery.invoiceBillingCity.str,
          InvoiceQuery.invoiceTotal.str,
          InvoiceQuery.invoiceCustomer.str
        ],
        values: [
          invoiceDate,
          billingAddress,
          billingState,
          billingPostalCode,
          billingCountry,
          billingCity,
          total,
          customer?.id
        ],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Invoice>, F, TF extends IColumn<F>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> oderByByHaving = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    List<T> having = const [],
    List<TF> innerJoin = const [],
    List<TF> leftJoin = const [],
    int offset = 0,
    int? limit,
    required E Function(Map<String, Object?>) parser,
    bool logQuery = true,
  }) =>
          ExtraQuery.instance.rawQuery<E, Invoice, T, F, TF>(
            name,
            ConfigSqflite.instance.database,
            parser: parser,
            groupBy: groupBy,
            having: having,
            innerJoin: innerJoin,
            leftJoin: leftJoin,
            limit: limit,
            logQuery: logQuery,
            oderByByHaving: oderByByHaving,
            offset: offset,
            orderBy: orderBy,
            select: select,
            where: where,
          );
  static String get rawDropTable => ExtraQuery.instance.dropTable(name);
}

class _InvoiceId extends IColumn<Invoice> {
  const _InvoiceId(
    super.str, {
    super.tableName,
  });
}

class _InvoiceInvoiceDate extends IColumn<Invoice> {
  const _InvoiceInvoiceDate(
    super.str, {
    super.tableName,
  });
}

class _InvoiceBillingAddress extends IColumn<Invoice> {
  const _InvoiceBillingAddress(
    super.str, {
    super.tableName,
  });
}

class _InvoiceBillingState extends IColumn<Invoice> {
  const _InvoiceBillingState(
    super.str, {
    super.tableName,
  });
}

class _InvoiceBillingPostalCode extends IColumn<Invoice> {
  const _InvoiceBillingPostalCode(
    super.str, {
    super.tableName,
  });
}

class _InvoiceBillingCountry extends IColumn<Invoice> {
  const _InvoiceBillingCountry(
    super.str, {
    super.tableName,
  });
}

class _InvoiceBillingCity extends IColumn<Invoice> {
  const _InvoiceBillingCity(
    super.str, {
    super.tableName,
  });
}

class _InvoiceTotal extends IColumn<Invoice> {
  const _InvoiceTotal(
    super.str, {
    super.tableName,
  });
}

class _InvoiceCustomer extends IColumn<Invoice> {
  const _InvoiceCustomer(
    super.str, {
    super.tableName,
  });
}

Invoice $InvoiceFromJsonDB(Map<String, dynamic> json) => Invoice(
    id: json['id'] as int? ?? 0,
    invoiceDate: json['invoiceDate'] as int,
    billingAddress: json['billingAddress'] as String,
    billingState: json['billingState'] as String?,
    billingPostalCode: json['billingPostalCode'] as String?,
    billingCountry: json['billingCountry'] as String,
    billingCity: json['billingCity'] as String,
    total: json['total'] as double,
    customer: json['customer'] != null
        ? Customer.fromJsonDB(json['customer'] as Map<String, dynamic>)
        : null);
