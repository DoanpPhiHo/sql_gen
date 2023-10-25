class Query {
  final List<String> select;
  final List<String> where;
  final List<String> group;
  final List<String> order;
  final List<String> like;
  final List<String> having;
  final List<String> join;

  const Query({
    this.select = const [],
    this.where = const [],
    this.group = const [],
    this.order = const [],
    this.like = const [],
    this.having = const [],
    this.join = const [],
  });
}

final query = Query();

abstract class ITableProperties<T> {
  final String str;

  const ITableProperties(this.str);

  @override
  String toString() => str;
}

class Count<E, T extends ITableProperties<E>> extends ITableProperties<E> {
  Count(this.field) : super('COUNT(${field.str})');
  final T field;
}

class BetweenValues<E, T extends ITableProperties<E>>
    extends ITableProperties<E> {
  BetweenValues(this.field, this.from, this.to)
      : super('${field.str} BETWEEN $from AND $to');
  final T field;
  final int from;
  final int to;
}

class WhereValue<E, T extends ITableProperties<E>> extends ITableProperties<E> {
  WhereValue(this.field, this.value) : super('${field.str} = $value');
  final T field;
  final int value;
}

class ElderValue<E, T extends ITableProperties<E>> extends ITableProperties<E> {
  ElderValue(this.field, this.value) : super('${field.str} > $value');
  final T field;
  final int value;
}

class Than<E, T extends ITableProperties<E>> extends ITableProperties<E> {
  Than(this.field, this.value) : super('${field.str} < $value');
  final T field;
  final int value;
}

class OrderByValue<E, T extends ITableProperties<E>>
    extends ITableProperties<E> {
  OrderByValue(
    this.field, {
    this.value = OrderBy.asc,
    this.nullsLast,
  }) : super('${field.str} ${nullsLast == true ? 'NULLS LAST' : value.str}');
  final T field;
  final OrderBy value;
  final bool? nullsLast;
}

enum OrderBy { asc, desc }

extension OrderByX on OrderBy {
  String get str {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';

      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension Limit on int? {
  String raw(int offset) {
    if (this == null) return '';
    return 'LIMIT $this OFFSET $offset';
  }
}

extension ListX on List<ITableProperties> {
  String get _s => ', ';
  String get _a => ' AND ';
  String get _grBy => 'GROUP BY ';
  String get _where => 'WHERE ';
  String get _having => 'HAVING ';
  String get _orderBy => 'ORDER BY ';
  String get _raw => map((e) => e.str).join(_s);
  String get _rawAnd => map((e) => e.str).join(_a);

  String get rawSelect {
    return isEmpty ? '*' : _raw;
  }

  String get rawGroup {
    if (isEmpty) return '';
    return _grBy + _raw;
  }

  String get rawWhere {
    if (isEmpty) return '';
    return _where + _rawAnd;
  }

  String get rawHaving {
    if (isEmpty) return '';
    return _having + _rawAnd;
  }

  String get rawOrderBy {
    if (isEmpty) return '';
    return _orderBy + _raw;
  }
}
