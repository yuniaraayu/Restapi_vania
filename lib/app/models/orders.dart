import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Orders extends Model {
  Orders() {
    MySqlConnection.connect;
    super.table('orders');
  }
}
