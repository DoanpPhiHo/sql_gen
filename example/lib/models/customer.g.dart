// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _CustomerId extends IColumn<Customer> {
  const _CustomerId(
    super.str, {
    super.tableName,
  });
}

class _CustomerFirstName extends IColumn<Customer> {
  const _CustomerFirstName(
    super.str, {
    super.tableName,
  });
}

class _CustomerLastName extends IColumn<Customer> {
  const _CustomerLastName(
    super.str, {
    super.tableName,
  });
}

class _CustomerCompany extends IColumn<Customer> {
  const _CustomerCompany(
    super.str, {
    super.tableName,
  });
}

class _CustomerAddress extends IColumn<Customer> {
  const _CustomerAddress(
    super.str, {
    super.tableName,
  });
}

class _CustomerCity extends IColumn<Customer> {
  const _CustomerCity(
    super.str, {
    super.tableName,
  });
}

class _CustomerState extends IColumn<Customer> {
  const _CustomerState(
    super.str, {
    super.tableName,
  });
}

class _CustomerCountry extends IColumn<Customer> {
  const _CustomerCountry(
    super.str, {
    super.tableName,
  });
}

class _CustomerPostalCode extends IColumn<Customer> {
  const _CustomerPostalCode(
    super.str, {
    super.tableName,
  });
}

class _CustomerPhone extends IColumn<Customer> {
  const _CustomerPhone(
    super.str, {
    super.tableName,
  });
}

class _CustomerFax extends IColumn<Customer> {
  const _CustomerFax(
    super.str, {
    super.tableName,
  });
}

class _CustomerEmail extends IColumn<Customer> {
  const _CustomerEmail(
    super.str, {
    super.tableName,
  });
}

class _CustomerSupportRep extends IColumn<Customer> {
  const _CustomerSupportRep(
    super.str, {
    super.tableName,
  });
}

Customer $CustomerFromJsonDB(Map<String, dynamic> json) => Customer(
    id: json['id'] as int? ?? 0,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    company: json['company'] as String?,
    address: json['address'] as String,
    city: json['city'] as String,
    state: json['state'] as String?,
    country: json['country'] as String,
    postalCode: json['postalCode'] as String?,
    phone: json['phone'] as String?,
    fax: json['fax'] as String?,
    email: json['email'] as String,
    supportRep: json['supportRep'] != null
        ? Customer.fromJsonDB(json['supportRep'] as Map<String, dynamic>)
        : null);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension CustomerQuery on Customer {
  static const IColumn<Customer> customerId =
      _CustomerId('id', tableName: 'customer');

  static const IColumn<Customer> customerFirstName =
      _CustomerFirstName('firstName', tableName: 'customer');

  static const IColumn<Customer> customerLastName =
      _CustomerLastName('lastName', tableName: 'customer');

  static const IColumn<Customer> customerCompany =
      _CustomerCompany('company', tableName: 'customer');

  static const IColumn<Customer> customerAddress =
      _CustomerAddress('address', tableName: 'customer');

  static const IColumn<Customer> customerCity =
      _CustomerCity('city', tableName: 'customer');

  static const IColumn<Customer> customerState =
      _CustomerState('state', tableName: 'customer');

  static const IColumn<Customer> customerCountry =
      _CustomerCountry('country', tableName: 'customer');

  static const IColumn<Customer> customerPostalCode =
      _CustomerPostalCode('postalCode', tableName: 'customer');

  static const IColumn<Customer> customerPhone =
      _CustomerPhone('phone', tableName: 'customer');

  static const IColumn<Customer> customerFax =
      _CustomerFax('fax', tableName: 'customer');

  static const IColumn<Customer> customerEmail =
      _CustomerEmail('email', tableName: 'customer');

  static const IColumn<Customer> customerSupportRep =
      _CustomerSupportRep('supportRepId', tableName: 'customer');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'company': company,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'postalCode': postalCode,
        'phone': phone,
        'fax': fax,
        'email': email,
        'supportRepId': supportRep?.id
      };
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT',
          'firstName TEXT',
          'lastName TEXT',
          'company TEXT NOT NULL',
          'address TEXT',
          'city TEXT',
          'state TEXT NOT NULL',
          'country TEXT',
          'postalCode TEXT NOT NULL',
          'phone TEXT NOT NULL',
          'fax TEXT NOT NULL',
          'email TEXT',
          'supportRepId int NOT NULL',
          'FOREIGN KEY (supportRepId) REFERENCES supportRep (id)'
        ],
      );
  static String get name => 'customer';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Customer, IColumn<Customer>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(customerId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Customer, IColumn<Customer>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(customerId, id),
      );
  static Future<Customer?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Customer, IColumn<Customer>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(customerId, id),
        parser: (e) => Customer.fromJsonDB(e),
      );
  static Future<Customer?> findOne() => ExtraQuery.instance.findOne<Customer>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Customer.fromJsonDB(e),
      );
  static Future<List<Customer>> find() => ExtraQuery.instance.find<Customer>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Customer.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          CustomerQuery.customerFirstName.str,
          CustomerQuery.customerLastName.str,
          CustomerQuery.customerCompany.str,
          CustomerQuery.customerAddress.str,
          CustomerQuery.customerCity.str,
          CustomerQuery.customerState.str,
          CustomerQuery.customerCountry.str,
          CustomerQuery.customerPostalCode.str,
          CustomerQuery.customerPhone.str,
          CustomerQuery.customerFax.str,
          CustomerQuery.customerEmail.str,
          CustomerQuery.customerSupportRep.str
        ],
        values: [
          firstName,
          lastName,
          company,
          address,
          city,
          state,
          country,
          postalCode,
          phone,
          fax,
          email,
          supportRep?.id
        ],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Customer>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Customer, T, F, TF>(
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
