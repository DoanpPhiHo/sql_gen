part of '../db_sql_query.dart';

class Count<E, T extends IColumn<E>> extends IColumn<E> {
  Count(this.field) : super('COUNT(${field._s})', tableName: field.tableName);
  final T field;
}

class Rename<E, T extends IColumn<E>> extends IColumn<E> {
  Rename(this.field, this.name)
      : super('${field._s} AS $name', tableName: field.tableName);
  final T field;
  final String name;
}

class GetName<E, T extends IColumn<E>> extends IColumn<E> {
  GetName(this.name) : super(name);
  final String name;
}

typedef JoinQuery<A extends ITable, B extends ITable, TA extends IColumn<A>,
        TB extends IColumn<B>>
    = TA Function(TA, TB);

String _parserTable<B, TB extends IColumn<B>>(TB tb) => tb.tableName!;

class InnerJoin<A extends ITable, B extends ITable, TA extends IColumn<A>,
    TB extends IColumn<B>> extends IColumn<A> {
  InnerJoin({
    this.where = const [],
    this.select = const [],
  })  : assert(where.isNotEmpty, 'Query Where is not empty!'),
        super(
            '${select.rawSelect}${_ss}INNER JOIN ${_parserTable(where.first)} ON ${where.map((e) => e._s).join(' AND ')}');

  final List<TB> where;
  final List<TB> select;
}

class LeftJoin<A extends ITable, B extends ITable, TA extends IColumn<A>,
    TB extends IColumn<B>> extends IColumn<A> {
  LeftJoin({
    this.where = const [],
    this.select = const [],
  })  : assert(where.isNotEmpty, 'Query Where is not empty!'),
        super(
            '${select.rawSelect}${_ss}LEFT JOIN ${_parserTable(where.first)} ON ${where.map((e) => e._s).join(' AND ')}');
  final List<TB> where;
  final List<TB> select;
}

const _ss = '#######';

class BetweenValues<E, T extends IColumn<E>> extends IColumn<E> {
  BetweenValues(this.field, this.from, this.to)
      : super('${field._s} BETWEEN $from AND $to');
  final T field;
  final int from;
  final int to;
}

class WhereValue<E, T extends IColumn<E>> extends IColumn<E> {
  WhereValue(this.field, this.value) : super('${field._s} = $value');
  final T field;
  final int value;
}

class ElderValue<E, T extends IColumn<E>> extends IColumn<E> {
  ElderValue(this.field, this.value) : super('${field._s} > $value');
  final T field;
  final int value;
}

class ThanValue<E, T extends IColumn<E>> extends IColumn<E> {
  ThanValue(this.field, this.value) : super('${field._s} < $value');
  final T field;
  final int value;
}

class EqualValue<E, T extends IColumn<E>, F> extends IColumn<E> {
  EqualValue(this.field, this.value)
      : super('${field._s} = ${value is IColumn ? value._s : value}',
            tableName: field.tableName);
  final T field;
  final F value;
}

class OrderByValue<E, T extends IColumn<E>> extends IColumn<E> {
  OrderByValue(
    this.field, {
    this.value = OrderBy.asc,
    this.nullsLast,
  }) : super('${field._s} ${nullsLast == true ? 'NULLS LAST' : value.str}');
  final T field;
  final OrderBy value;
  final bool? nullsLast;
}

enum OrderBy { asc, desc }
