import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Admin extends Model {
  Admin() {
    MySqlConnection.connect;
    super.table('admin');
  }
}
