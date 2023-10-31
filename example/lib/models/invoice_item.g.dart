// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension InvoiceItemQuery on InvoiceItem {
  static const IColumn<InvoiceItem> invoiceItemId =
      _InvoiceItemId('id', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemUnitPrice =
      _InvoiceItemUnitPrice('unitPrice', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemQuantity =
      _InvoiceItemQuantity('quantity', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemInvoice =
      _InvoiceItemInvoice('invoiceId', tableName: 'invoice_item');

  static const IColumn<InvoiceItem> invoiceItemTrack =
      _InvoiceItemTrack('trackId', tableName: 'invoice_item');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'invoiceId': invoice?.id,
        'trackId': track?.id
      };
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL',
          'unitPrice INTEGER NOT NULL',
          'quantity INTEGER NOT NULL',
          'invoiceId INTEGER',
          'trackId INTEGER',
          'FOREIGN KEY (invoiceId) REFERENCES invoice (id) ON DELETE NO ACTION ON UPDATE NO ACTION',
          'FOREIGN KEY (trackId) REFERENCES track (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
        ],
      );
  static String get name => 'invoice_item';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, InvoiceItem, IColumn<InvoiceItem>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(invoiceItemId, id),
      );
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
          InvoiceItemQuery.invoiceItemUnitPrice.str,
          InvoiceItemQuery.invoiceItemQuantity.str,
          InvoiceItemQuery.invoiceItemInvoice.str,
          InvoiceItemQuery.invoiceItemTrack.str
        ],
        values: [unitPrice, quantity, invoice?.id, track?.id],
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

class _InvoiceItemInvoice extends IColumn<InvoiceItem> {
  const _InvoiceItemInvoice(
    super.str, {
    super.tableName,
  });
}

class _InvoiceItemTrack extends IColumn<InvoiceItem> {
  const _InvoiceItemTrack(
    super.str, {
    super.tableName,
  });
}

InvoiceItem $InvoiceItemFromJsonDB(Map<String, dynamic> json) => InvoiceItem(
    id: json['id'] as int? ?? 0,
    unitPrice: json['unitPrice'] as int,
    quantity: json['quantity'] as int,
    invoice: json['invoice'] != null
        ? Invoice.fromJsonDB(json['invoice'] as Map<String, dynamic>)
        : null,
    track: json['track'] != null
        ? Track.fromJsonDB(json['track'] as Map<String, dynamic>)
        : null);
