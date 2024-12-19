import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Productnotes extends Model {
  Productnotes() {
    MySqlConnection.connect;
    super.table('productnotes');
  }
}
