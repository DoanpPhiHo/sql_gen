// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _InvoiceItemId extends IColumn<InvoiceItem> {
  const _InvoiceItemId(
    super.str, {
    super.tableName,
  });
}

class _InvoiceItemUnitPrice extends IColumn<InvoiceItem> {
  const _InvoiceItemUnitPrice(
    super.str, {
    super.tableName,
  });
}

class _InvoiceItemQuantity extends IColumn<InvoiceItem> {
  const _InvoiceItemQuantity(
    super.str, {
    super.tableName,
  });
}

class _InvoiceItemInvoiceId extends IColumn<InvoiceItem> {
  const _InvoiceItemInvoiceId(
    super.str, {
    super.tableName,
  });
}

class _InvoiceItemTrackId extends IColumn<InvoiceItem> {
  const _InvoiceItemTrackId(
    super.str, {
    super.tableName,
  });
}

extension InvoiceItemField on InvoiceItem {
  static const IColumn<InvoiceItem> invoiceItemId =
      _InvoiceItemId('id', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemUnitPrice =
      _InvoiceItemUnitPrice('unitPrice', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemQuantity =
      _InvoiceItemQuantity('quantity', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemInvoiceId =
      _InvoiceItemInvoiceId('invoiceId', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemTrackId =
      _InvoiceItemTrackId('trackId', tableName: 'invoice_item');
}

InvoiceItem $InvoiceItemFromJsonDB(Map<String, dynamic> json) => InvoiceItem(
    id: json['id'] as int? ?? 0,
    unitPrice: json['unitPrice'] as int,
    quantity: json['quantity'] as int,
    invoiceId: json['invoiceId'] as int,
    trackId: json['trackId'] as int);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension InvoiceItemQuery on InvoiceItem {
  static String get name => 'invoice_item';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'unitPrice INTEGER NOT NULL',
          'quantity INTEGER NOT NULL',
          'invoiceId INTEGER NOT NULL',
          'trackId INTEGER NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, InvoiceItem, IColumn<InvoiceItem>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(invoiceItemId, id),
      );
  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'invoiceId': invoiceId,
        'trackId': trackId
      };
  Future<void> update() =>
      ExtraQuery.instance.update<int, InvoiceItem, IColumn<InvoiceItem>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(invoiceItemId, id),
      );
  static Future<InvoiceItem?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, InvoiceItem, IColumn<InvoiceItem>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(invoiceItemId, id),
        parser: (e) => InvoiceItem.fromJsonDB(e),
      );
  static Future<InvoiceItem?> findOne() =>
      ExtraQuery.instance.findOne<InvoiceItem>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => InvoiceItem.fromJsonDB(e),
      );
  static Future<List<InvoiceItem>> find() =>
      ExtraQuery.instance.find<InvoiceItem>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => InvoiceItem.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          InvoiceItemField.invoiceItemUnitPrice.str,
          InvoiceItemField.invoiceItemQuantity.str,
          InvoiceItemField.invoiceItemInvoiceId.str,
          InvoiceItemField.invoiceItemTrackId.str
        ],
        values: [unitPrice, quantity, invoiceId, trackId],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<InvoiceItem>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, InvoiceItem, T, F, TF>(
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
