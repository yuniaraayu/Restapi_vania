import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Products extends Model {
  Products() {
    MySqlConnection.connect;
    super.table('products');
  }
}
