import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Orderitems extends Model {
  Orderitems() {
    MySqlConnection.connect;
    super.table('orderitems');
  }
}
