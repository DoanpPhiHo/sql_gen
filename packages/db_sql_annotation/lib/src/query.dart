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
