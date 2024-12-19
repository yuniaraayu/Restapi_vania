import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Customer extends Model {
  Customer() {
    MySqlConnection.connect;
    super.table('customers');
  }
}
