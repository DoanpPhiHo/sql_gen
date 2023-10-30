import 'package:db_sql_query/db_sql_query.dart';

part 'customer.g.dart';

@ModelSql()
class Customer extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String firstName;
  @column
  final String lastName;
  @column
  final String? company;
  @column
  final String address;
  @column
  final String city;
  @column
  final String? state;
  @column
  final String country;
  @column
  final String? postalCode;
  @column
  final String? phone;
  @column
  final String? fax;
  @column
  final String email;
  // employeeId
  @column
  final String supportRepId;

  Customer({
    this.id = 0,
    required this.firstName,
    required this.address,
    required this.city,
    this.company,
    required this.country,
    required this.email,
    this.fax,
    required this.lastName,
    this.phone,
    this.postalCode,
    this.state,
    required this.supportRepId,
  });

  factory Customer.fromJsonDB(Map<String, dynamic> json) =>
      $CustomerFromJsonDB(json);
}
